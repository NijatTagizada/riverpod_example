import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/model/todo_model.dart';

import 'todo_notifier_state.dart';

class TodoNotifier extends StateNotifier<TodoState> {
  TodoNotifier(this.dio) : super(const Loading());

  final Dio dio;

  Future<void> fetchData() async {
    try {
      final response = await dio.get('/todos');

      final List<TodoModel> data = [];

      for (var i in response.data) {
        data.add(TodoModel.fromJson(i));
      }

      state = Success(data: data);
    } catch (e) {
      state = const Error();
    }
  }
}
