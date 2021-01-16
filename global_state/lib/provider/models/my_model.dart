import 'package:flutter/widgets.dart';

class MyModel extends ChangeNotifier{
  Map<String, int> _items = {
    'Bananas': 0,
    'Maçãs': 0,
    'Laranjas': 0,
    'Abacaxis': 0
  };

  bool _isLoading = false;

  Map get items => _items;
  bool get isLoading => _isLoading;

  // Editing the global state
  void incrementItem(String item) async {
    _isLoading = true;
    notifyListeners(); // Updates the interface

    await Future.delayed(Duration(seconds: 1));

    _isLoading = false;
    _items[item]++;
    notifyListeners();
  }

  void decreaseItem(String item) async {
    if(_items[item] == 0) return;

    _isLoading = true;
    notifyListeners(); // Updates the interface

    await Future.delayed(Duration(seconds: 1));

    _isLoading = false;
    _items[item]--;
    notifyListeners();
  }
}