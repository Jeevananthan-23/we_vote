import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'dart:async';

// ignore: must_be_immutable
class Vote extends StatelessWidget {
  Web3Client ethClient;
  Client httpClient;
  final myAddress = '0x629FeC431C389281c181fee2f9161F05E1604C08';
  var myData;

  Future<DeployedContract> localContract() async {
    String abi =
        await rootBundle.loadString("assets/abi.json"); //assets\abi.json
    String contractAddress = "0x20964E38EFE0B33b36c742f466063C27bb4E6a0b";

    final contract = DeployedContract(ContractAbi.fromJson(abi, "Ballot"),
        EthereumAddress.fromHex(contractAddress));

    return contract;
  }

  Future<String> submit(String functionName, List<dynamic> args) async {
    EthPrivateKey creditional = EthPrivateKey.fromHex(
        "754b4abd51f174dc5232676eb2a923df9b50d283c5f13c154a4a8e9895ddfde8");
    final contract = await localContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.sendTransaction(
        creditional,
        Transaction.callContract(
            contract: contract,
            function: ethFunction,
            parameters: args,
            maxGas: 3000000),
        fetchChainIdFromNetworkId: true);
    return result;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    final contract = await localContract();
    final ethFunction = contract.function(functionName);
    final result = await ethClient.call(
        contract: contract, function: ethFunction, params: args);

    return result;
  }

  Future<String> getWinner() async {
    httpClient = Client();
    ethClient = Web3Client('http://127.0.0.1:8585', httpClient);
    String result = (await query("GetWinner", [])) as String;
    myData = result;
    print("got");
    return result;
  }

  Future<String> addVoter(String name, int adharno) async {
    httpClient = Client();
    ethClient = Web3Client('http://127.0.0.1:8585', httpClient);
    String result = await submit("addVoter", [name, adharno]);
    print(result);
    return result.toString();
  }

  Future<dynamic> candidates(int cadid) async {
    httpClient = Client();
    ethClient = Web3Client('http://127.0.0.1:8585', httpClient);
    List result = (await query("candidates", [cadid]));
    myData = result;
    print("got");
    return result;
  }

  Future<String> endVote() async {
    httpClient = Client();
    ethClient = Web3Client('http://127.0.0.1:8585', httpClient);
    String result = await submit("endVote", []);
    return result;
  }

  Future<String> startVote() async {
    httpClient = Client();
    ethClient = Web3Client('http://127.0.0.1:8585', httpClient);
    String result = await submit("startVote", []);
    return result;
  }

  Future<dynamic> vote(int candId) async {
    httpClient = Client();
    ethClient = Web3Client('http://127.0.0.1:8585', httpClient);
    String result = await submit("vote", [candId]);
    print(result);
    return result.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vote Analysis"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //   FutureBuilder(builder: builder)
            Text("GetWinner: Indian National Congress")
          ],
        ),
      ),
    );
  }
}
