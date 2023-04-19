import 'package:banana_challenge_client/src/repositories/base_repository.dart';
import 'package:banana_challenge_commons/banana_challenge_commons.dart';
import 'package:http/http.dart';

///
class RepositoryProduct extends Repository {
  /// the base client
  late final Client client;

  ///
  Future<List<Product>> getProducts() async {
    final response = await client.get(
      Uri.parse(
        'https://jsonplaceholder.typicode.com/todos/1',
      ),
    );

    return performClientOperation<List<Product>>(
      response: response,
      callback: (data) {
        return <Product>[];
      },
    );
  }
}
