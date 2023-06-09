import 'package:banana_challenge_app/product/cubit/product_state.dart';
import 'package:banana_challenge_client/banana_challenge_client.dart';
import 'package:banana_challenge_commons/banana_challenge_commons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(const ProductState());

  final repo = RepositoryProduct();

  Future<void> getHomeData() async {
    emit(state.copyWith(status: ProductStatus.attempting));

    try {
      final productList = await repo.getProducts();

      emit(
        state.copyWith(status: ProductStatus.success, products: productList),
      );
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.failure));
    }
  }

  Future<void> getProductsBySearch(String search) async {
    emit(state.copyWith(status: ProductStatus.attempting));

    try {
      final productList = await repo.searchProductByName(search);

      emit(
        state.copyWith(status: ProductStatus.success, products: productList),
      );
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.failure));
    }
  }

  Future<void> getProductById(int id) async {
    emit(state.copyWith(status: ProductStatus.attempting));

    try {
      final product = await repo.getProductById(id);

      emit(
        state.copyWith(status: ProductStatus.success, selectedProduct: product),
      );
    } catch (e) {
      emit(state.copyWith(status: ProductStatus.failure));
    }
  }

  void updateStarCount(Product product) {
    final productStars = (product.starCount ?? 0) + 1;
    try {
      emit(
        state.copyWith(
          status: ProductStatus.success,
          products: state.products
              .map(
                (e) => e.id == product.id
                    ? product.copyWith(starCount: productStars)
                    : e,
              )
              .toList(),
        ),
      );
    } catch (e, st) {
      throw Exception('We should handle: $e, $st');
    }
  }
}
