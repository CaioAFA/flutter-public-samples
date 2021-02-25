import 'package:mobx/mobx.dart';

part 'computed_value_store.g.dart';

class ComputedValueStore = _ComputedValueStore with _$ComputedValueStore;

abstract class _ComputedValueStore with Store {

  @observable
  String firstname = '';

  @observable
  String lastname = '';

  // This way we can add a computed value
  @computed
  String get fullname => firstname + ' ' + lastname;

  @action
  void changeFirstname(String value) => firstname = value.trim();

  @action
  void changeLastname(String value) => lastname = value.trim();
}