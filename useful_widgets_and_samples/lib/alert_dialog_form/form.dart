import 'package:flutter/material.dart';

showCreateTodoAlertDialog(BuildContext context){
  final _formKey = GlobalKey<FormState>();

  final _inputController = TextEditingController();

  return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Insira Algum Texto'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: _inputController,
                  decoration: InputDecoration(
                      hintText: 'Digite aqui...'
                  ),
                  validator: (value){
                    if(value.isEmpty) return 'Preencha esse campo!';
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: [
            FlatButton(
              child: const Text("Cancelar",),
              onPressed: () {
                Navigator.of(context).pop(null);
              },
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const Text("OK", style: TextStyle(color: Colors.white),),
              onPressed: () {
                if (_formKey.currentState.validate()) {

                  // Return data to Other Screen
                  Navigator.of(context).pop(_inputController.text);
                }
              },
            ),
          ],
        );
      }
  );
}