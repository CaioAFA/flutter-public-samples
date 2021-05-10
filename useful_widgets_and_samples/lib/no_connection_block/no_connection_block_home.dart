import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:useful_widgets/no_connection_block/block_screen.dart';

// To block the app when the user doesn't have internet,
// create a Listener and DON'T CANCEL/DISPOSE IT.

class NoConnectionBlockHome extends StatefulWidget {
  @override
  _NoConnectionBlockHomeState createState() => _NoConnectionBlockHomeState();
}

class _NoConnectionBlockHomeState extends State<NoConnectionBlockHome> {

  bool isActive = false;

  // ignore: cancel_subscriptions
  StreamSubscription listener;

  @override
  void initState(){
    super.initState();

    // Here, we listen to connectivity changes. When there is no internet connection,
    // we'll open BlockScreen.
    // IMPORTANT: Create this listener only ONE TIME in your App.
    // Example: create the listener on your base screen, that will never be closed / disposed!
    listener = Connectivity().onConnectivityChanged.listen((ConnectivityResult connectivityResult) async {
      if(listener.isPaused) return;

      // Check again, because the result coming from callback is not 100% correct.
      connectivityResult = await Connectivity().checkConnectivity();

      if(connectivityResult == ConnectivityResult.none){
        listener.pause();

        await Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => BlockScreen())
        );

        listener.resume();
      }
    });

    // Check internet Connection when enter the screen
    Connectivity().checkConnectivity().then((ConnectivityResult connectivityResult) async {
      if(connectivityResult == ConnectivityResult.none){
        listener.pause();

        await Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => BlockScreen())
        );

        listener.resume();
      }
    });

  }

  @override
  void dispose() {
    listener.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloquear App Sem Conexão'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Desligue seu Wi-Fi e os Dados Móveis.\n\n'
                  'Caso queira essa função no App inteiro, adicione o código de exemplo na tela '
                  'principal do seu App, na qual não haverá dispose e o listener funcionará sempre '
                  'e em todo lugar!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
