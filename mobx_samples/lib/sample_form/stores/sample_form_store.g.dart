// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sample_form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SampleFormStore on _SampleFormStore, Store {
  Computed<bool> _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: '_SampleFormStore.nameValid'))
          .value;
  Computed<bool> _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: '_SampleFormStore.emailValid'))
          .value;
  Computed<bool> _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_SampleFormStore.isFormValid'))
          .value;
  Computed<Function> _$getSubmitFunctionComputed;

  @override
  Function get getSubmitFunction => (_$getSubmitFunctionComputed ??=
          Computed<Function>(() => super.getSubmitFunction,
              name: '_SampleFormStore.getSubmitFunction'))
      .value;

  final _$nameAtom = Atom(name: '_SampleFormStore.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_SampleFormStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_SampleFormStore.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$_SampleFormStoreActionController =
      ActionController(name: '_SampleFormStore');

  @override
  void setName(String value) {
    final _$actionInfo = _$_SampleFormStoreActionController.startAction(
        name: '_SampleFormStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_SampleFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_SampleFormStoreActionController.startAction(
        name: '_SampleFormStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_SampleFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsLoading(bool value) {
    final _$actionInfo = _$_SampleFormStoreActionController.startAction(
        name: '_SampleFormStore.setIsLoading');
    try {
      return super.setIsLoading(value);
    } finally {
      _$_SampleFormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
isLoading: ${isLoading},
nameValid: ${nameValid},
emailValid: ${emailValid},
isFormValid: ${isFormValid},
getSubmitFunction: ${getSubmitFunction}
    ''';
  }
}
