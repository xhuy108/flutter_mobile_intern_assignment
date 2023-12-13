import 'package:flutter_mobile_intern_assignment/models/product.dart';

class CartItem {
  Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      product: Product.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': {
        'id': product.id,
        'name': product.name,
        'description': product.description,
        'price': product.price,
        'image': product.image,
        'color': product.color,
      },
      'quantity': quantity,
    };
  }
}
