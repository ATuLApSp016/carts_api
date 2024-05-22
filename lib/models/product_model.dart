class Product {
  int? id;
  String? title;
  int? price;
  int? quantity;
  int? total;
  int? discountPercentage;
  int? discountedPrice;
  String? thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedPrice,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        quantity: json['quantity'],
        total: json['total'],
        discountPercentage: json['discountPercentage'],
        discountedPrice: json['discountedPrice'],
        thumbnail: json['thumbnail']);
  }
}
