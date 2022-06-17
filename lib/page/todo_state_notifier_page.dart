import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/provider_init.dart';

class StateNotifierPage extends ConsumerStatefulWidget {
  const StateNotifierPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _StateNotifierPageState();
}

class _StateNotifierPageState extends ConsumerState<StateNotifierPage> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(todoNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo Notifier Page'),
      ),
      body: state.when(
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: () => const Center(
          child: Text('Something is wrong!!!'),
        ),
        success: (data) => ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(data[index].title),
                    const SizedBox(height: 10),
                    Text('Is Completed: ${data[index].completed}'),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(height: 10);
          },
        ),
      ),
    );
  }
}
