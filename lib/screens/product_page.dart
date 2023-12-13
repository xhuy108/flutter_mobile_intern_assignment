import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobile_intern_assignment/config/app_color.dart';
import 'package:flutter_mobile_intern_assignment/cubit/store_cubit.dart';

import 'package:flutter_mobile_intern_assignment/widgets/product_item.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreCubit, StoreState>(
      builder: (context, state) {
        if (state.productsStatus == StoreStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColor.yellow,
            ),
          );
        }
        if (state.productsStatus == StoreStatus.failed) {
          return const Center(
            child: Text('Failed to load products'),
          );
        }
        if (state.productsStatus == StoreStatus.initial) {
          return const Center(
            child: Text('No products'),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: state.products.length,
          itemBuilder: (ctx, index) => ProductItem(
            product: state.products[index],
          ),
        );
      },
    );
  }
}
