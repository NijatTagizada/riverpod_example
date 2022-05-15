import 'package:flutter/material.dart';

class CounterBloc extends ChangeNotifier {
  int count = 0;

  void increase() {
    count++;
    notifyListeners();
  }
}
