import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

// This screen BLOCKS the user from go back.
// The only way to do this is turning wi-fi / mobile data on.

class BlockScreen extends StatefulWidget {
  @override
  _BlockScreenState createState() => _BlockScreenState();
}

class _BlockScreenState extends State<BlockScreen> {

  var timer;

  @override
  void initState() {
    super.initState();

    // Here we check the internet status.
    timer = Timer.periodic(new Duration(seconds: 3), (timer) async {
      Connectivity().checkConnectivity().then((state){
          if(state == ConnectivityResult.mobile || state == ConnectivityResult.wifi){
            Navigator.of(context).pop(); // Go back
          }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){}, // When press the "back" button on smartphone, nothing will happen
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // Remove "Go Back" arrow
          title: Text('Ooops!'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.signal_wifi_bad,
              size: 60,
            ),
            Text(
              'Verifique sua conexão com a internet',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }

}
