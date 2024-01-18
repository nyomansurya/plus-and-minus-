import 'package:flutter/material.dart';

class PlusMinus with ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;
  bool get isMinusEnabled => (_counter > 0) ? true : false;
  bool get isPlusEnabled => (_counter < 20) ? true : false;

  void plus() {
    _counter++;
    notifyListeners();
  }

  void minus() {
    _counter--;
    notifyListeners();
  }
}
