import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class CounterModel extends Model {
  // OBS: Private variables must start with _
  int _counter = 0;
  bool isLoading = false;

  int get counter => _counter;

  static CounterModel of(BuildContext context) => ScopedModel.of<CounterModel>(context);

  void increment() async {
    isLoading = true;
    notifyListeners(); // This updates the interface.

    // Some delay
    await Future.delayed(Duration(seconds: 1));

    _counter++;
    isLoading = false;
    notifyListeners();
  }
}
