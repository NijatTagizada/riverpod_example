// Mocks generated by Mockito 5.2.0 from annotations
// in riverpod_example/test/main_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;
import 'dart:typed_data' as _i5;

import 'package:dio/src/adapter.dart' as _i2;
import 'package:dio/src/options.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeResponseBody_0 extends _i1.Fake implements _i2.ResponseBody {}

/// A class which mocks [HttpClientAdapter].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpClientAdapter extends _i1.Mock implements _i2.HttpClientAdapter {
  MockHttpClientAdapter() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<_i2.ResponseBody> fetch(
          _i4.RequestOptions? options,
          _i3.Stream<_i5.Uint8List>? requestStream,
          _i3.Future<dynamic>? cancelFuture) =>
      (super.noSuchMethod(
              Invocation.method(#fetch, [options, requestStream, cancelFuture]),
              returnValue:
                  Future<_i2.ResponseBody>.value(_FakeResponseBody_0()))
          as _i3.Future<_i2.ResponseBody>);
  @override
  void close({bool? force = false}) =>
      super.noSuchMethod(Invocation.method(#close, [], {#force: force}),
          returnValueForMissingStub: null);
}
