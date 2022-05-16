import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

const String _chars =
    'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
final Random _rnd = Random();

String _getRandomString(int length) => String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
      ),
    );

class RandomWordNotifier extends StateNotifier<String> {
  RandomWordNotifier() : super('random text');

  void getRandomWord() => state = _getRandomString(15);
}
