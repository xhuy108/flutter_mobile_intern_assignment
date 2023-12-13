import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobile_intern_assignment/models/cart_item.dart';
import 'package:flutter_mobile_intern_assignment/models/product.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(const StoreState());

  Future<void> loadProducts() async {
    try {
      emit(state.copyWith(
        productsStatus: StoreStatus.loading,
      ));

      final String response =
          await rootBundle.loadString('lib/data/shoes.json');
      final Map<String, dynamic> data = await json.decode(response);

      List<Product> products = data['shoes']
          .map<Product>((product) => Product.fromJson(product))
          .toList();

      emit(state.copyWith(
        productsStatus: StoreStatus.success,
        products: products,
      ));
    } catch (e) {
      emit(state.copyWith(
        productsStatus: StoreStatus.failed,
      ));
    }
  }
}
