import 'package:flutter_mobile_intern_assignment/models/product.dart';

class CartItem {
  Product product;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
  });
}
