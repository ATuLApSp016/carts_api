import 'package:carts_api/models/product_model.dart';

class Cart {
  int? id;
  List<Product>? products;
  int? total;
  int? discountedTotal;
  int? userId;
  int? totalProducts;
  int? totalQuantity;

  Cart({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory Cart.fromJson(Map<String, dynamic> json) {
    List<Product> mProducts = [];

    for (Map<String, dynamic> eachProduct in json['products']) {
      mProducts.add(Product.fromJson(eachProduct));
    }

    return Cart(
        id: json['id'],
        products: mProducts,
        total: json['total'],
        discountedTotal: json['discountedTotal'],
        userId: json['userId'],
        totalProducts: json['totalProducts'],
        totalQuantity: json['totalQuantity']);
  }
}
