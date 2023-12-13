import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_intern_assignment/cubit/store_cubit.dart';
import 'package:flutter_mobile_intern_assignment/widgets/cart_list_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = context.watch<StoreCubit>().state.cart;

    if (cart.isEmpty) {
      return const Text(
        'Your cart is empty.',
        style: TextStyle(
          fontSize: 14,
        ),
      );
    }

    return ListView.builder(
      itemCount: cart.length,
      itemBuilder: (ctx, index) => CartListItem(
        item: cart[index],
      ),
    );
  }
}
