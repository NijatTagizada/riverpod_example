import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/bloc/counter_bloc.dart';

import '../di/provider_init.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);

    ref.listen<CounterBloc>(counterProvider, (previous, next) {
      if (next.count > 5) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Count more than 5'),
            duration: Duration(milliseconds: 500),
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Page'),
        actions: [
          IconButton(
            onPressed: () => ref.invalidate(counterProvider),
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${counter.count}',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider).increase();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
