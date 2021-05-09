import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:useful_widgets/no_connection_block/block_screen.dart';

class NoConnectionBlockHome extends StatefulWidget {
  @override
  _NoConnectionBlockHomeState createState() => _NoConnectionBlockHomeState();
}

class _NoConnectionBlockHomeState extends State<NoConnectionBlockHome> {

  bool isActive = false;

  StreamSubscription listener;

  @override
  void initState() {
    super.initState();

    listener = Connectivity().onConnectivityChanged.listen((ConnectivityResult connectivityResult) async {
      if(connectivityResult == ConnectivityResult.none)
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (_) => BlockScreen())
        );
    });
  }

  @override
  void dispose() {
    if(!isActive)
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            isActive ?
              'Em qualquer lugar do App, se não houver internet ligada, ele será bloqueado' :
              'Ativar função de bloquear App quando não houver internet?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),

          SizedBox(height: 20,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text(
                    isActive ? 'Desativar' : 'Ativar'
                ),
                onPressed: (){
                  setState(() {
                    isActive = !isActive;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
