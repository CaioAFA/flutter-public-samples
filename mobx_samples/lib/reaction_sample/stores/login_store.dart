import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {

  @observable
  String email = 'abc@def.com.br';

  @observable
  String password = '123456';

  @observable
  bool isLoading = false;

  @observable
  bool isLoggedIn = false;

  @action
  void setEmail(String value) => email = value.trim();

  @action
  void setPassword(String value) => password = value.trim();

  @observable
  Map<String, dynamic> loginStatus = Map<String, dynamic>.of({
    'isLogged': false,
    'errorMessage': ''
  });

  @action
  Future<void> login() async {
    isLoading = true;

    await Future.delayed(Duration(seconds: 2));

    if(email == 'abc@def.com.br' && password == '123456'){
      loginStatus = {
        'isLogged': true,
        'errorMessage': ''
      };
    }
    else
      loginStatus = {
        'isLogged': false,
        'errorMessage': 'Verifique suas credenciais!'
      };

    isLoading = false;
  }
}