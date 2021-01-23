import 'package:flutter/material.dart';
import 'package:useful_widgets/alert_dialog/form.dart';

class AlertDialogFormHome extends StatefulWidget {
  @override
  _AlertDialogFormHomeState createState() => _AlertDialogFormHomeState();
}

class _AlertDialogFormHomeState extends State<AlertDialogFormHome> {

  String insertedData = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialog Form'),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Insira um Texto',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 30.0,),
              FlatButton(
                color: Theme.of(context).primaryColor,
                onPressed: () async {
                  // Get the data from AlertDialog Form
                  final formData = await showCreateTodoAlertDialog(context);

                  if(formData == null) return;

                  setState(() {
                    insertedData = formData;
                  });
                },
                child: Text(
                  'Inserir',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white
                  ),
                )
              ),
              insertedData.isEmpty ? Container() : SizedBox(height: 30.0,),
              insertedData.isEmpty ? Container() :
                Text(
                  'Ultimo dado inserido: ${insertedData}',
                  style: TextStyle(
                      fontSize: 20.0,
                  ),
                )
            ]
        ),
      ),
    );
  }
}
