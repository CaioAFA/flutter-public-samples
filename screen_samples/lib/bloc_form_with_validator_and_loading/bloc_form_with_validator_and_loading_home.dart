import 'package:flutter/material.dart';
import 'package:screen_samples/bloc_form_with_validator_and_loading/form/form_with_validator_and_loading_home.dart';

class BlocFormWithValidatorAndLoadingHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      FormWithValidatorAndLoadingSample()
                    ],
                  ),
                ]
              ),

              // Loading Container
              /*
              Container(
                color: Colors.black.withAlpha(150),
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              )
             */
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
