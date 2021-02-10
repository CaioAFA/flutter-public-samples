import 'package:flutter/material.dart';
import 'package:screen_samples/bloc_form_with_validator_and_loading/form/form_sample.dart';
import 'package:screen_samples/bloc_form_with_validator_and_loading/form/login_bloc.dart';

class BlocFormWithValidatorAndLoadingHome extends StatelessWidget {

  final _loginBloc = LoginBloc();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  BlocFormWithValidatorAndLoadingHome(){
    // Listen the changes to Form State
    _loginBloc.outState.listen((state){
      switch(state){
        case LoginState.LOADING:
        case LoginState.IDLE:
          break;

        case LoginState.SUCCESS:
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text('Sucesso!'), backgroundColor: Colors.green,)
          );
          break;
        case LoginState.ERROR:
          _scaffoldKey.currentState.showSnackBar(
            SnackBar(content: Text('Falha! Entre como usuário admin@admin.com - 1234'), backgroundColor: Colors.red,)
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.white, Colors.black]
          )
        ),
        child: SafeArea(
          child: Stack(
            children: [
              ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _renderFormTitle(),
                      SizedBox(height: 150,),
                      FormSample(_loginBloc)
                    ],
                  ),
                ]
              ),

              // Loading Container
              StreamBuilder<LoginState>(
                stream: _loginBloc.outState,
                builder: (context, snapshot) {
                  if(!snapshot.hasData) return IgnorePointer(); // Will ignore touch events
                  if(snapshot.data != LoginState.LOADING) return IgnorePointer();

                  return Container(
                    color: Colors.black.withAlpha(150),
                    child: Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderFormTitle(){
    return Text(
      'BLoC - Formulário Com Validação E Loading',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 40.0,
        fontWeight: FontWeight.bold,
        shadows: <Shadow>[
          Shadow(
            offset: Offset(3.0, 3.0),
            blurRadius: 8.0,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
