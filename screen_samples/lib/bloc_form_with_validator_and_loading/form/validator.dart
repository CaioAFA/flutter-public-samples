import 'dart:async';

class FormValidator{
  // <String, String> -> <String Input, String Output>
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
      handleData: (email, sink){
        // If valid e-mail
        if(email.contains('@')){
          sink.add(email);
        }

        // If not, we send one error
        else{
          sink.addError('Insira um e-mail válido!');
        }
      }
  );

  final validatePassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink){
        if(password.length > 3){
          sink.add(password);
        }
        else{
          sink.addError('Senha inválida! Deve conter, pelo menos, 3 caracteres.');
        }
      }
  );
}