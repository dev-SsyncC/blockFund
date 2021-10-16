import 'package:blockfund/utils/Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/contracts.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

class ViewCollection extends StatefulWidget {
  final Detail? block;
  const ViewCollection({Key? key, this.block}) : super(key: key);

  @override
  _CreatViewCollection createState() => _CreatViewCollection();
}

class _CreatViewCollection extends State<ViewCollection> {
  var myData;
  var list = [];

//----------------------------Block Chain Handling----------------------//

  late Client httpClient;

  late Web3Client ethClient;

  final myAdress = "0x9524B0672317FDcF4d52A9105F24cEF710DD564B";

  String url = "https://rinkeby.infura.io/v3/4c650166389b477b917e2e8f94a774c1";

  @override
  void initState() {
    super.initState();
    httpClient = Client();
    ethClient = Web3Client(url, httpClient);
    arr(widget.block!.key);
  }

  Future<DeployedContract> loadcontract() async {
    String abi = await rootBundle.loadString('assets/abi.json');
    String contractAdress =
        "0x92c274b249aC86E3D2A723827A0C87E391da2011"; //change as per contract

    final contract = DeployedContract(ContractAbi.fromJson(abi, "bf"),
        EthereumAddress.fromHex(contractAdress));

    return contract;
  }

  Future<List<dynamic>> query(String functionname, List<dynamic> args) async {
    final contract = await loadcontract();
    final ethFunction = contract.function(functionname);
    var result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);

    return result;
  }

  Future<String> submit(String functionName, List<dynamic> args) async {
    EthPrivateKey credential = EthPrivateKey.fromHex(
        "f5cfc56460ddf6c709dcd5965071fcaa5519ff57a663233196e30c562fda8cc3");
    DeployedContract contract = await loadcontract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.sendTransaction(
        credential,
        Transaction.callContract(
            contract: contract,
            function: ethFunction,
            parameters: args,
            maxGas: 100000),
        chainId: 4);

    return result;
  }

  Future<void> arr(String? key) async {
    List<dynamic> result = await query("arr", [key]);
    myData = result;
    myData[0].forEach((item) {
      list.add(item);
    });
    setState(() {});
    print(result);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ViewCollection'),
      ),
      body: Container(
        child: list.length == 0
            ? Center(child: Text('No transactions yet!'))
            : new ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.list),
                    title: Text("Amount of Rs.${list[index][0]}"),
                    subtitle: Text("From - ${list[index][1]}"),
                  );
                }),
      ),
    );
  }
}
