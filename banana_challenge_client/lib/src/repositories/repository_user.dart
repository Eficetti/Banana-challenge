import 'package:banana_challenge_client/src/repositories/base_repository.dart';
import 'package:http/http.dart' as http;

///
class RepositoryUser extends Repository {
  ///
  Future<bool> login() async {
    final url = Uri.http('https://dummyjson.com/auth/login');

    final response = await http.post(
      url,
      body: {
        'email': 'email',
        'password': 'password',
      },
    );

    return performClientOperation<bool>(
      response: response,
      callback: (data) {
        return true;
      },
    );
  }
}
