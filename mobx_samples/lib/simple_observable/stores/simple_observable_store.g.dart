// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_observable_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SimpleObservableStore on _SimpleObservableStore, Store {
  final _$countAtom = Atom(name: '_SimpleObservableStore.count');

  @override
  int get count {
    _$countAtom.reportRead();
    return super.count;
  }

  @override
  set count(int value) {
    _$countAtom.reportWrite(value, super.count, () {
      super.count = value;
    });
  }

  final _$_SimpleObservableStoreActionController =
      ActionController(name: '_SimpleObservableStore');

  @override
  void incrementCount() {
    final _$actionInfo = _$_SimpleObservableStoreActionController.startAction(
        name: '_SimpleObservableStore.incrementCount');
    try {
      return super.incrementCount();
    } finally {
      _$_SimpleObservableStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
count: ${count}
    ''';
  }
}
