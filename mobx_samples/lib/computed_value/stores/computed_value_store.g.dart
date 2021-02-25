// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'computed_value_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ComputedValueStore on _ComputedValueStore, Store {
  Computed<String> _$fullnameComputed;

  @override
  String get fullname =>
      (_$fullnameComputed ??= Computed<String>(() => super.fullname,
              name: '_ComputedValueStore.fullname'))
          .value;

  final _$firstnameAtom = Atom(name: '_ComputedValueStore.firstname');

  @override
  String get firstname {
    _$firstnameAtom.reportRead();
    return super.firstname;
  }

  @override
  set firstname(String value) {
    _$firstnameAtom.reportWrite(value, super.firstname, () {
      super.firstname = value;
    });
  }

  final _$lastnameAtom = Atom(name: '_ComputedValueStore.lastname');

  @override
  String get lastname {
    _$lastnameAtom.reportRead();
    return super.lastname;
  }

  @override
  set lastname(String value) {
    _$lastnameAtom.reportWrite(value, super.lastname, () {
      super.lastname = value;
    });
  }

  final _$_ComputedValueStoreActionController =
      ActionController(name: '_ComputedValueStore');

  @override
  void changeFirstname(String value) {
    final _$actionInfo = _$_ComputedValueStoreActionController.startAction(
        name: '_ComputedValueStore.changeFirstname');
    try {
      return super.changeFirstname(value);
    } finally {
      _$_ComputedValueStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeLastname(String value) {
    final _$actionInfo = _$_ComputedValueStoreActionController.startAction(
        name: '_ComputedValueStore.changeLastname');
    try {
      return super.changeLastname(value);
    } finally {
      _$_ComputedValueStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
firstname: ${firstname},
lastname: ${lastname},
fullname: ${fullname}
    ''';
  }
}
