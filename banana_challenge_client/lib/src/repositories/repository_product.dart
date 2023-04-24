import 'package:banana_challenge_client/src/repositories/base_repository.dart';
import 'package:banana_challenge_commons/banana_challenge_commons.dart';
import 'package:http/http.dart' as http;

/// Main repository for the product API calls.
class RepositoryProduct extends Repository {
  /// This method will get a list of products from the API.
  Future<List<Product>> getProducts() async {
    final url = Uri.https(
      Repository.baseUrl,
      '/products',
    );

    final response = await http.get(url);

    return performClientOperation<List<Product>>(
      response: response,
      callback: (data) {
        final products = data['products'] as List<dynamic>;

        return products
            .map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }

  /// This method will get a product by id from the API.
  Future<Product> getProductById(String id) async {
    final url = Uri.https(
      Repository.baseUrl,
      '/products/$id',
    );

    final response = await http.get(url);

    return performClientOperation<Product>(
      response: response,
      callback: Product.fromJson,
    );
  }

  /// This method will search a product by name from the API.
  Future<List<Product>> searchProductByName(String name) async {
    final qp = {
      'q': name,
    };

    final uri = Uri.https(Repository.baseUrl, '/products/search', qp);
    final response = await http.get(uri);

    return performClientOperation<List<Product>>(
      response: response,
      callback: (data) {
        final products = data['products'] as List<dynamic>;

        return products
            .map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList();
      },
    );
  }
}
