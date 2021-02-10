import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:screen_samples/bloc_form_with_validator_and_loading/form/validator.dart';

enum LoginState { IDLE, LOADING, SUCCESS, ERROR }

// We'll use the FormValidator methods, declared in validator.dart!
class LoginBloc extends BlocBase with FormValidator{

  // Every form field must have:
  // - One Controller;
  // - One "get" method with validation;
  // - One "get" method to change the values
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  final _stateController = BehaviorSubject<LoginState>(); // Form is loading? Is Idle?

  // Get Field with validation
  Stream<String> get outEmail => _emailController.stream.transform(validateEmail);
  Stream<String> get outPassword => _passwordController.stream.transform(validatePassword);

  Stream<LoginState> get outState => _stateController.stream;

  // The submit button will be enabled if email and password has values
  Stream<bool> get isSubmitButtonValid => Observable.combineLatest2(
    outEmail, outPassword, (a, b) => true
  );

  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  LoginBloc(){
    _stateController.add(LoginState.IDLE);
  }

  void submit() async {
    final email = _emailController.value;
    final password = _passwordController.value;

    _stateController.add(LoginState.LOADING);

    await Future.delayed(Duration(seconds: 2));

    if(email == 'admin@admin.com' && password == '1234'){
      _stateController.add(LoginState.SUCCESS);
    }
    else{
      _stateController.add(LoginState.ERROR);
    }
  }

  @override
  void dispose() {
    _emailController.close();
    _passwordController.close();
    _stateController.close();
  }

}