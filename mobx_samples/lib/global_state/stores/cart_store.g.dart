// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CartStore on _CartStore, Store {
  final _$cartItemsAtom = Atom(name: '_CartStore.cartItems');

  @override
  ObservableList<String> get cartItems {
    _$cartItemsAtom.reportRead();
    return super.cartItems;
  }

  @override
  set cartItems(ObservableList<String> value) {
    _$cartItemsAtom.reportWrite(value, super.cartItems, () {
      super.cartItems = value;
    });
  }

  final _$_CartStoreActionController = ActionController(name: '_CartStore');

  @override
  void addCartItem(String item) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.addCartItem');
    try {
      return super.addCartItem(item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCartItem(int index) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.removeCartItem');
    try {
      return super.removeCartItem(index);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cartItems: ${cartItems}
    ''';
  }
}
