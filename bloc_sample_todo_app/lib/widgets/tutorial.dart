import 'package:flutter/material.dart';

showTutorial(BuildContext context){
  return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Tutorial'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('- Crie tarefas a partir do botão + na Home Screen.\n\n'
                   '- Delete as tarefas movendo a tarefa para a esquerda.\n\n'
                   '- Marque as tarefas como concluídas pressionando a Check Box.\n\n'
                   '- Os dados são salvos ao sair do aplicativo.')
            ],
          ),
          actions: [
            FlatButton(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const Text("Entendido!", style: TextStyle(color: Colors.white),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
  );
}