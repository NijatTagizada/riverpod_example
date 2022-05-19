import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifier/counter_notifier.dart';
import '../notifier/random_word_notifier.dart';
import '../notifier/todo_notifier.dart';
import '../notifier/todo_notifier_state.dart';

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
  return TodoNotifier(
    ref.watch(dioProvider),
  )..fetchData();
});

final dioProvider = Provider<Dio>((ref) {
  Dio dio = Dio();
  BaseOptions options = BaseOptions(
    baseUrl: 'https://jsonplaceholder.typicode.com',
    headers: {
      'Content': 'application/json',
    },
  );

  dio.options = options;
  return dio;
});
