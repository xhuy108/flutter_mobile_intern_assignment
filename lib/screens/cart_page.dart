import 'package:flutter/material.dart';
import 'package:flutter_mobile_intern_assignment/widgets/cart_list_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (ctx, index) => const CartListItem(),
    );
  }
}
