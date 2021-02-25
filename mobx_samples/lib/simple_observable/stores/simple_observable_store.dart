/* To generate this code, use a template: it's easier! */

import 'package:mobx/mobx.dart';

part 'simple_observable_store.g.dart';

class SimpleObservableStore = _SimpleObservableStore with _$SimpleObservableStore;

abstract class _SimpleObservableStore with Store {

  // Creating a observable variable. When it changes, the interface will be notified.
  @observable
  int count = 0;

  // To edit state, we need a action!
  @action
  void incrementCount(){
    count++;
  }

}