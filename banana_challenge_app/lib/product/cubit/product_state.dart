import 'package:banana_challenge_commons/banana_challenge_commons.dart';

/// The status of the Product related API calls.
enum ProductStatus {
  /// The first state when its instanced.
  initial,

  /// The state is trying to make the API call.
  attempting,

  /// The API return a 200 (ok).
  success,

  /// The API return a unsuccessfully response code.
  failure;

  bool get isInitial => this == ProductStatus.initial;
  bool get isAttempting => this == ProductStatus.attempting;
  bool get isSuccess => this == ProductStatus.success;
  bool get isFailure => this == ProductStatus.failure;
}

class ProductState {
  const ProductState({
    this.status = ProductStatus.initial,
    this.products = const [],
    this.selectedProduct,
  });

  final ProductStatus status;
  final List<Product> products;
  final Product? selectedProduct;

  ProductState copyWith({
    ProductStatus? status,
    List<Product>? products,
    Product? selectedProduct,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
      selectedProduct: selectedProduct ?? this.selectedProduct,
    );
  }
}
