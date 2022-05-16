import 'dart:math';

import 'package:flutter/material.dart';

class RandomWordNotifier extends ChangeNotifier {
  String word = 'random text';

  void getRandomWord() {
    word = _getRandomString(15);
    notifyListeners();
  }
}

const String _chars =
    'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
final Random _rnd = Random();

String _getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
      ),
    );
