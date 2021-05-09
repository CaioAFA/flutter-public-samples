import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class BlockScreen extends StatefulWidget {
  @override
  _BlockScreenState createState() => _BlockScreenState();
}

class _BlockScreenState extends State<BlockScreen> {

  var timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(new Duration(seconds: 1), (timer) async {
      final state = await Connectivity().checkConnectivity();
      if(state == ConnectivityResult.mobile || state == ConnectivityResult.wifi){
        Navigator.of(context).pop();
      }
    });
  }


  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ooops!'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.signal_wifi_bad,
            size: 60,
          ),
          Text(
            'Verifique sua conexão com a internet'
          )
        ],
      ),
    );
  }

}
