import 'package:flutter/material.dart';
import 'package:screen_samples/bloc_form_with_validator_and_loading/form/login_bloc.dart';
import 'package:screen_samples/bloc_form_with_validator_and_loading/form/validator.dart';

class FormSample extends StatefulWidget {

  final LoginBloc _loginBloc;

  FormSample(this._loginBloc);

  @override
  _FormSampleState createState() => _FormSampleState();
}

class _FormSampleState extends State<FormSample> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            StreamBuilder<String>(
              stream: widget._loginBloc.outEmail,
              builder: (context, snapshot) {
                return TextFormField(
                  decoration: _getInputDecoration(label: 'E-Mail', icon: Icons.person, error: snapshot.error,),
                  onChanged: widget._loginBloc.changeEmail,
                  keyboardType: TextInputType.emailAddress,
                );
              }
            ),

            SizedBox(height: 20.0,),

            StreamBuilder<String>(
              stream: widget._loginBloc.outPassword,
              builder: (context, snapshot) {
                return TextFormField(
                  obscureText: true,
                  decoration: _getInputDecoration(label: 'Senha', icon: Icons.lock, error: snapshot.error),
                  onChanged: widget._loginBloc.changePassword,
                  keyboardType: TextInputType.visiblePassword,
                );
              }
            ),

            SizedBox(height: 20,),

            Align(
              alignment: Alignment.centerRight,
              child: StreamBuilder<bool>(
                stream: widget._loginBloc.isSubmitButtonValid,
                builder: (context, snapshot) {
                  return FlatButton(
                    color: Colors.black,
                    disabledColor: Colors.black38,
                    splashColor: Colors.white30,
                    height: 45,
                    onPressed: snapshot.hasData ? (){
                      widget._loginBloc.submit();
                    } : null,
                    child: Text(
                      'Submit!',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }

  InputDecoration _getInputDecoration({@required String label, @required IconData icon, @required String error}){
    final hasError = (error != null);

    final enabledBorder = OutlineInputBorder(
      borderRadius: new BorderRadius.circular(20.0),
      borderSide:  BorderSide(
        color: hasError ? Colors.red : Colors.black,
        width: 3
      ),
    );

    final focusedBorder = OutlineInputBorder(
      borderRadius: new BorderRadius.circular(15.0),
      borderSide:  BorderSide(
        color: hasError ? Colors.red : Colors.black,
        width: 3
      ),
    );

    final errorBorder = OutlineInputBorder(
      borderRadius: new BorderRadius.circular(15.0),
      borderSide:  BorderSide(
          color: hasError ? Colors.red : Colors.black,
          width: 3
      ),
    );

    return InputDecoration(
      icon: Icon(icon, color: Colors.black,),
      border: OutlineInputBorder(),
      enabledBorder: enabledBorder,
      focusedBorder: focusedBorder,
      errorBorder: errorBorder,
      focusedErrorBorder: errorBorder,
      labelText: label,
      labelStyle: TextStyle(
        color: hasError ? Colors.red : Colors.black
      ),
      errorText: hasError ? error : null,
    );
  }
}
