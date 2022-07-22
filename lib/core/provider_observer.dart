import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderLogger extends ProviderObserver {
  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    super.didAddProvider(provider, value, container);
    log(
      '${value.hashCode} | ${value.runtimeType} was added',
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
      '$provider was updated, newValue=>$newValue',
      name: "ProviderLogger",
    );
  }
}
