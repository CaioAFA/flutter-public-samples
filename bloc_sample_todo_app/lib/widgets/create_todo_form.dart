import 'package:flutter/material.dart';

showCreateTodoAlertDialog(BuildContext context){
  final _formKey = GlobalKey<FormState>();

  final _createTodoTitleController = TextEditingController();
  final _createTodoDescriptionController = TextEditingController();

  return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: const Text('Criar Tarefa'),
          content: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  controller: _createTodoTitleController,
                  decoration: InputDecoration(
                      hintText: 'Título'
                  ),
                  validator: (value){
                    if(value.isEmpty) return 'Preencha esse campo!';
                    return null;
                  },
                ),
                TextFormField(
                  controller: _createTodoDescriptionController,
                  decoration: InputDecoration(
                    hintText: 'Decrição',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  minLines: 4,
                  textAlign: TextAlign.justify,
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
                Navigator.of(context).pop(<String, dynamic>{});
              },
            ),
            FlatButton(
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: const Text("Criar", style: TextStyle(color: Colors.white),),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Navigator.of(context).pop({
                    'title': _createTodoTitleController.text,
                    'description': _createTodoDescriptionController.text
                  });
                }
              },
            ),
          ],
        );
      }
  );
}
