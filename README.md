# blockFund - A way to donate

blockFund is a fundraiser Dapp which uses blockchain technology created with flutter, firebase, solidity, web3dart and infura.io.

It uses an Ethereum smart contract written in solidity and communicates with it using the web3dart library.

An Ethereum contract acts as a backend to store to transactions that have or will happen in the future.

A user can create his/her account which is stored on firebase's authentication.

| <img src="images/loginpage.png" width="200"> | <img src="images/loginpage2.png" width="200"> | <img src="images/loginprocess.png" width="200"> |

which then sends them to the home screen or feed which is fetched from the firebase real-time storage for fast retrieval of data.

view collection sends them to the view collection screen which fetches data from the contract as an array of tuples
which is then destructured into list tiles which shows the amount and senders account information.

| <img src="images/homeorfeed.png" width="200"> | | <img src="images/drawer.png" width="200"> | | <img src="images/createcolletion.png" width="200"> |

On the drawer, they can add a new collection which will later show on the feed after the complete checking of resources provided.

Users can also log out from here.

- create collection will send them to the createcollection screen which is linked with firebase storage to store information about the receiver.
- learn more sends them to the information page.
- send help sends them to the payment page which is connected to the blockchain and can later be connected to the payment gateway using gateway SDKs.
