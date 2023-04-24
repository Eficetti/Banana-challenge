import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed

/// This is the main DTO model for the product
class Product with _$Product {
  /// This is the factory constructor for the product
  const factory Product({
    /// This is the id of the product
    int? id,

    /// This is the title of the product
    String? title,

    /// This is the description of the product
    String? description,

    /// This is the price of the product
    double? price,

    /// This is the discount percentage of the product
    double? discountPercentage,

    /// This is the rating of the product
    double? rating,

    /// This is the stock of the product
    int? stock,

    /// This is the brand of the product
    String? brand,

    /// This is the category of the product
    String? category,

    /// This is the thumbnail of the product
    String? thumbnail,

    /// This is the images of the product
    List<String>? images,
  }) = _Product;

  /// Method from json to product
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  const Product._();
}
