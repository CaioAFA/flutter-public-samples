import 'package:mobx/mobx.dart';

part 'list_observable_store.g.dart';

class ListObservableStore = _ListObservableStore with _$ListObservableStore;

abstract class _ListObservableStore with Store {

  // With Observable<Type>, we don't need @observable.
  // We have ObservableList, ObservableMap, ObservableStream...
  ObservableList<String> list = ObservableList<String>();

  @action
  void addToList(String value){
    list.add(value);
  }

  @action
  void removeElement(String element){
    list.remove(element);
  }
}