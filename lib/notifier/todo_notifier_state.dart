import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/todo_model.dart';

part 'todo_notifier_state.freezed.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState.loading() = Loading;
  const factory TodoState.error() = Error;
  const factory TodoState.success({required List<TodoModel> data}) = Success;
}
