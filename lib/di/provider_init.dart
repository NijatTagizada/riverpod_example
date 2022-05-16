import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bloc/todo_notifier.dart';
import '../bloc/todo_notifier_state.dart';
import '../bloc/counter_notifier.dart';
import '../bloc/random_word_notifier.dart';

final counterProvider =
    ChangeNotifierProvider.autoDispose<CounterNotifier>((ref) {
  return CounterNotifier();
});

final randomWordProvider =
    ChangeNotifierProvider.autoDispose<RandomWordNotifier>((ref) {
  return RandomWordNotifier();
});

final todoNotifierProvider =
    AutoDisposeStateNotifierProvider<TodoNotifier, TodoState>((ref) {
  return TodoNotifier()..fetchData();
});
