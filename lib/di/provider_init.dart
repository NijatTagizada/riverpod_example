import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../bloc/counter_bloc.dart';

final counterProvider = ChangeNotifierProvider.autoDispose<CounterBloc>((ref) {
  return CounterBloc();
});
