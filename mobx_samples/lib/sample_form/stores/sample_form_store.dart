import 'package:mobx/mobx.dart';

part 'sample_form_store.g.dart';

class SampleFormStore = _SampleFormStore with _$SampleFormStore;

abstract class _SampleFormStore with Store {
  // ----------------------------- Name
  @observable
  String name;

  @action
  void setName(String value) => name = value;

  @computed
  bool get nameValid => name != null && name.length >= 4;
  String get nameError {
    if(name == null || nameValid)
      return null;

    else if(name.isEmpty)
      return 'Campo obrigatório!';

    return 'Insira um nome com mais de 4 caracteres!';
  }

  // ----------------------------- E-mail
  @observable
  String email;

  @action
  void setEmail(String value) => email = value;

  @computed
  bool get emailValid{
    if(email == null)
      return false;

    final RegExp regExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$"
    );
    return regExp.hasMatch(email);
  }
  String get emailError {
    if(email == null || emailValid)
      return null;

    else if(email.isEmpty)
      return 'Campo obrigatório!';

    return 'E-mail inválido.';
  }

  // ----------------------------- Form
  @computed
  bool get isFormValid => nameValid && emailValid;

  @observable
  bool isLoading = false;

  @action
  void setIsLoading(bool value) => isLoading = value;

  @computed
  Function get getSubmitFunction => isFormValid ? submit : null;

  Future<void> submit() async {
    setIsLoading(true);

    // Simulate a form submition...
    await Future.delayed(Duration(seconds: 2));

    setIsLoading(false);
  }
}