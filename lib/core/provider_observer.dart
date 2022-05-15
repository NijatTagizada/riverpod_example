import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    super.didAddProvider(provider, value, container);
    log(
      '$provider was added',
      name: "ProviderLogger",
    );
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    super.didDisposeProvider(provider, container);
    log(
      '$provider was disposed',
      name: "ProviderLogger",
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log(
      '$provider was updated(new value ${newValue.toString()})',
      name: "ProviderLogger",
    );
  }
}