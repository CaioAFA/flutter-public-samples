import 'package:flutter/material.dart';
import 'package:useful_widgets/custom_form_input/image_input.dart';

// Sempre que criar formulários, utilize um Statefull!
class CustomFormInputHome extends StatefulWidget {
  @override
  _CustomFormInputHomeState createState() => _CustomFormInputHomeState();
}

class _CustomFormInputHomeState extends State<CustomFormInputHome> {

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Column(
          children: [
            Text('Custom Form Inputs', ),
            Text(
              'Campos personalizados para formulários',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14
              ),
            )
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(height: 10.0,),
            Text(
              'Abaixo, um exemplo de campo para imagens personalizado',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 20.0,),
            ImageInput(
              context: context,
              validator: (List l){
                if(l.length == 0){
                  return 'Insira alguma foto!';
                }
                return null;
              },
              onSaved: (l){ // Executed after save() method
                // Do something with the data
                print(l);
              },
              autovalidateMode: AutovalidateMode.disabled,
              initialValue: [],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  color: Colors.lightBlue,
                  onPressed: (){
                    final formIsValid = _formKey.currentState.validate();

                    if(formIsValid){
                      _formKey.currentState.save(); // Execute onSaved() method
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.lightBlue,
                            duration: Duration(seconds: 2),
                            content: Text('OK!', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                          )
                      );
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
