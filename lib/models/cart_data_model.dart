import 'package:carts_api/models/cart_model.dart';

class CartData {
  List<Cart>? carts;
  int? total;
  int? skip;
  int? limit;

  CartData({
    required this.carts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory CartData.fromJson(Map<String, dynamic> json) {
    List<Cart> mCarts = [];

    for (Map<String, dynamic> eachCart in json['carts']) {
      mCarts.add(Cart.fromJson(eachCart));
    }
    return CartData(
      carts: mCarts,
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }
}
