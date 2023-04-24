import 'package:banana_challenge_client/src/repositories/base_repository.dart';
import 'package:banana_challenge_commons/banana_challenge_commons.dart';
import 'package:http/http.dart' as http;

/// Main repository for the user API calls.
class RepositoryUser extends Repository {
  /// This method will login the user.
  Future<User> login({
    required String email,
    required String password,
  }) async {
    final url = Uri.https(Repository.baseUrl, '/auth/login');

    final response = await http.post(
      url,
      body: {
        'username': email,
        'password': password,
      },
    );

    return performClientOperation<User>(
      response: response,
      callback: User.fromJson,
    );
  }
}
