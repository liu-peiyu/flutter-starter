import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 0;

  int get getCount => _count;

  void increase() {
    _count++;
    notifyListeners();
  }
}
