import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';

/// All repositories have to inherit from this.
abstract class Repository {
  /// Base url for the API.
  static const baseUrl = 'dummyjson.com';

  /// This method will perform the client operation.
  Future<T> performClientOperation<T>({
    required Response response,
    required T Function(Map<String, dynamic> data) callback,
  }) async {
    try {
      if (response.statusCode == HttpStatus.ok) {
        return callback.call(ResposeX(response).body);
      }
      throw Exception('Whe should handle this error');
    } catch (e, st) {
      throw Exception('Whe should handle this error, $e \n $st');
    }
  }
}

/// Extension for the response.
extension ResposeX on Response {
  /// This method will return the body as a map.
  Map<String, dynamic> get body => bodyBytes.isNotEmpty
      ? (bodyBytes.length > 2
          ? jsonDecode(utf8.decode(bodyBytes)) as Map<String, dynamic>
          : <String, dynamic>{})
      : <String, dynamic>{};
}
