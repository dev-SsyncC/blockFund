import 'package:blockfund/Components/rowbuttons.dart';
import 'package:blockfund/utils/Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';

class Payment extends StatefulWidget {
  final Detail? block;
  Payment({Key? key, @required this.block}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  var moneyController = TextEditingController();
  var _upiId = TextEditingController();

  var myData;

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
  }

  Future<DeployedContract> loadcontract() async {
    String abi = await rootBundle.loadString('assets/abi.json');
    String contractAdress =
        "0x0fF43DefA2c35Cc3e1E0CD3fa5C8852493c6290b"; //change as per contract

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

  Future<String> add(String? key, int amount, String upi) async {
    var bigAmount = BigInt.from(amount);
    var response = await submit("add", [key, bigAmount, upi]);
    print('adding done');
    return response;
  }

//------------------------------------Block Chain Ends-------------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(left: 0),
            leading: IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_balance),
              iconSize: 45,
            ),
            title: Text(widget.block!.name ??
                'Reciver\'s name here'), // widget.karke block access karna pad raha hai;
            subtitle: Text(widget.block!.account ?? 'UPI ID'),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: moneyController,
              decoration: InputDecoration(
                labelText: "Amount",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _upiId,
              decoration: InputDecoration(
                labelText: "Upi Id",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Or send',
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: MyButtons(),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextButton(
                child: Text('Initiate Transaction'),
                onPressed: () {
                  add(widget.block!.key, int.parse(moneyController.text),
                      _upiId.text);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
