import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_intern_assignment/config/app_color.dart';
import 'package:flutter_mobile_intern_assignment/cubit/store_cubit.dart';
import 'package:flutter_mobile_intern_assignment/widgets/cart_list_item.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        if (state.cartsStatus == StoreStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.yellow,
            ),
          );
        }
        if (state.cartsStatus == StoreStatus.failed) {
          return const Center(
            child: Text('Failed to load cart'),
          );
        }
        if (state.productsStatus == StoreStatus.initial) {
          return const Center(
            child: Text('No cart'),
          );
        }
        if (state.cart.isEmpty) {
          return const Text(
            'Your cart is empty.',
            style: TextStyle(
              fontSize: 14,
            ),
          );
        }

        return ListView.builder(
          itemCount: state.cart.length,
          itemBuilder: (ctx, index) => CartListItem(
            item: state.cart[index],
          ),
        );
      },
    );
  }
}
