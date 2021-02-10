import 'package:flutter/material.dart';

class FormWithValidatorAndLoadingSample extends StatefulWidget {
  @override
  _FormWithValidatorAndLoadingSampleState createState() => _FormWithValidatorAndLoadingSampleState();
}

class _FormWithValidatorAndLoadingSampleState extends State<FormWithValidatorAndLoadingSample> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: new InputDecoration(
                icon: Icon(Icons.person, color: Colors.black,),
                border: OutlineInputBorder(),
                enabledBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                  borderSide:  BorderSide(color: Colors.black, width: 3),
                ),
                focusedBorder: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                  borderSide:  BorderSide(color: Colors.black, width: 3),
                ),
                labelText: 'E-Mail',
                labelStyle: TextStyle(
                  color: Colors.black
                )
              ),
            ),
            SizedBox(height: 20.0,),
            TextFormField(
              obscureText: true,
              decoration: new InputDecoration(
                  icon: Icon(Icons.lock, color: Colors.black,),
                  border: OutlineInputBorder(),
                  enabledBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                    borderSide:  BorderSide(color: Colors.black, width: 3),
                  ),
                  focusedBorder: new OutlineInputBorder(
                    borderRadius: new BorderRadius.circular(15.0),
                    borderSide:  BorderSide(color: Colors.black, width: 3),
                  ),
                  labelText: 'Senha',
                  labelStyle: TextStyle(
                    color: Colors.black
                  )
              ),
            ),
            SizedBox(height: 20,),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                color: Colors.black,
                splashColor: Colors.white30,
                height: 45,
                onPressed: (){

                },
                child: Text(
                  'Submit!',
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
