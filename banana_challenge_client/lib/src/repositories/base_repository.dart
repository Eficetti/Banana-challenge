import 'dart:async';
import 'dart:io';

import 'package:http/http.dart';

/// All repositories have to inherit from this.
abstract class Repository {
  ///s
  Future<T> performClientOperation<T>({
    required Response response,
    required T Function(String data) callback,
  }) async {
    try {
      if (response.statusCode == HttpStatus.ok) {
        return response.body as T;
      }
      throw Exception('Whe should handle this error');
    } catch (e, st) {
      throw Exception('Whe should handle this error, $e \n $st');
    }
  }
}
