import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../di/provider_init.dart';

class ConsumerPage extends StatelessWidget {
  const ConsumerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiProvide Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Consumer(
            builder: (context, ref, child) {
              final counter = ref.watch(counterProvider);

              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => counter.decrease(),
                    icon: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    '${counter.count}',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () => counter.increase(),
                    icon: const Icon(Icons.add),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 50),
          Consumer(
            builder: (context, ref, child) {
              final randomWord = ref.watch(randomWordProvider);
              final randomWordNotifier = ref.watch(randomWordProvider.notifier);

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    randomWord,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(height: 10),
                  MaterialButton(
                    color: Colors.amber,
                    onPressed: () => randomWordNotifier.getRandomWord(),
                    child: const Text('Random Word'),
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
