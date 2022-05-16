import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bloc/counter_notifier.dart';
import '../bloc/random_word_notifier.dart';

final counterProvider =
    ChangeNotifierProvider.autoDispose<CounterNotifier>((ref) {
  return CounterNotifier();
});

final randomWordProvider =
    StateNotifierProvider.autoDispose<RandomWordNotifier, String>((ref) {
  return RandomWordNotifier();
});
