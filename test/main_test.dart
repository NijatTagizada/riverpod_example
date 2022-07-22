import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_example/notifier/todo_notifier.dart';
import 'package:riverpod_example/notifier/todo_notifier_state.dart';
import 'package:riverpod_example/providers/provider_init.dart';

import 'main_test.mocks.dart';

@GenerateMocks([HttpClientAdapter])
void main() {
  test('defaults to 0 and notify listeners when value changes', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    container.read(counterProvider).increase();
    expect(container.read(counterProvider).count, 1);
  });

  test('State testing', () async {
    final adapter = MockHttpClientAdapter();

    final container = ProviderContainer(overrides: [
      todoNotifierProvider.overrideWithValue(TodoNotifier(
        Dio()..httpClientAdapter = adapter,
      ))
    ]);
    addTearDown(container.dispose);

    final response = ResponseBody.fromString(
      '[]',
      200,
      headers: {
        Headers.contentTypeHeader: [Headers.jsonContentType],
      },
    );

    when(adapter.fetch(any, any, any)).thenAnswer(
      (_) async {
        return response;
      },
    );

    expect(container.read(todoNotifierProvider), const Loading());
    
    await container.read(todoNotifierProvider.notifier).fetchData();

    expect(container.read(todoNotifierProvider),  const Success(data:[]));
  });
}
