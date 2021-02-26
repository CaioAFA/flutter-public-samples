import 'package:mobx/mobx.dart';

part 'cart_store.g.dart';

class CartStore = _CartStore with _$CartStore;

abstract class _CartStore with Store {
  @observable
  ObservableList<String> cartItems = ObservableList<String>();

  @action
  void addCartItem(String item) => cartItems.add(item);

  @action
  void removeCartItem(int index) => cartItems.removeAt(index);
}