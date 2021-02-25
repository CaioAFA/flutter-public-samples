import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_samples/reaction_sample/stores/login_store.dart';

class ReactionSampleHome extends StatefulWidget {
  @override
  _ReactionSampleHomeState createState() => _ReactionSampleHomeState();
}

class _ReactionSampleHomeState extends State<ReactionSampleHome> {

  // Init the store
  final LoginStore _loginStore = LoginStore();

  // We need this to dispose the reaction at the screen dispose
  ReactionDisposer _reactionDisposer;

  TextEditingController _emailController;
  TextEditingController _passwordController;

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _ReactionSampleHomeState(){
    _emailController = TextEditingController(text: _loginStore.email);
    _passwordController = TextEditingController(text: _loginStore.password);

    // Execute the code when the state changes
    _reactionDisposer = reaction(
      (_) => _loginStore.loginStatus,
      (loginStatus){
        bool isLogged = loginStatus['isLogged'];
        String errorMessage = loginStatus['errorMessage'];

        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Text(
              isLogged ? 'Login efetuado com sucesso!' : errorMessage,
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            backgroundColor: isLogged ? Colors.green : Colors.red,
          )
        );
      }
    );
  }

  @override
  void dispose() {
    // Disposing the reaction to free resources
    _reactionDisposer();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Reações'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: _emailController,
              onChanged: _loginStore.setEmail,
              decoration: InputDecoration(
                labelText: 'E-Mail',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person)
              ),
            ),

            SizedBox(height: 20.0,),

            TextField(
              controller: _passwordController,
              onChanged: _loginStore.setPassword,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),

            SizedBox(height: 10.0,),

            Observer(
              builder: (context){
                // If it's loading, render a Progress Indicator
                if(_loginStore.isLoading){
                  return SizedBox(
                    width: 40.0,
                    height: 40.0,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      color: Colors.black,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  );
                }

                // If it's not loading, render the login button
                return SizedBox(
                  width: 150.0,
                  height: 40.0,
                  child: RaisedButton(
                      child: Text('Login', style: TextStyle(fontSize: 17),),
                      textColor: Colors.white,
                      color: Colors.black,
                      onPressed: _loginStore.login
                  ),
                );
              }
            )
          ],
        ),
      ),
    );
  }
}
