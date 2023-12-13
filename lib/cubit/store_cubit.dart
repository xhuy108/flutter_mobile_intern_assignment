import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:bloc/bloc.dart';

import 'package:flutter_mobile_intern_assignment/models/cart_item.dart';
import 'package:flutter_mobile_intern_assignment/models/product.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void addToCart(CartItem item) {
    emit(
      state.copyWith(
        cart: [...state.cart, item],
        cartTotalPrice:
            state.cartTotalPrice + item.product.price * item.quantity,
      ),
    );

    saveCart();
  }

  void removeFromCart(CartItem item) {
    final updatedCart = [...state.cart];
    updatedCart.remove(item);

    final totalPrice =
        state.cartTotalPrice - item.product.price * item.quantity;

    emit(
      state.copyWith(
        cart: updatedCart,
        cartTotalPrice: totalPrice.abs(),
      ),
    );

    saveCart();
  }

  void increaseCartItemQuantity(CartItem item) {
    state.cart
        .firstWhere(
          (element) => element.product.id == item.product.id,
        )
        .quantity++;

    emit(
      state.copyWith(
        cart: state.cart,
        cartTotalPrice: state.cartTotalPrice + item.product.price,
      ),
    );

    saveCart();
  }

  void decreaseCartItemQuantity(CartItem item) {
    state.cart
        .firstWhere(
          (element) => element.product.id == item.product.id,
        )
        .quantity--;

    double totalPrice = state.cartTotalPrice - item.product.price;

    emit(
      state.copyWith(
        cart: state.cart,
        cartTotalPrice: totalPrice,
      ),
    );

    saveCart();
  }

  Future<void> loadCart() async {
    try {
      emit(
        state.copyWith(
          cartsStatus: StoreStatus.loading,
        ),
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();

      List<String>? cartItemsJson = prefs.getStringList('cart');

      List<CartItem> loadedCart = [];

      //print(cartItemsJson);

      if (cartItemsJson != null) {
        loadedCart = cartItemsJson
            .map(
              (json) => CartItem.fromJson(
                jsonDecode(json),
              ),
            )
            .toList();
      }

      double totalPrice = 0;
      for (final item in loadedCart) {
        totalPrice += (item.product.price * item.quantity);
      }

      emit(
        state.copyWith(
          cart: [...state.cart, ...loadedCart],
          cartTotalPrice: totalPrice,
          cartsStatus: StoreStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          cartsStatus: StoreStatus.failed,
        ),
      );
    }
  }

  void saveCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> cartItemsJson = state.cart
        .map(
          (item) => jsonEncode(
            item.toJson(),
          ),
        )
        .toList();

    prefs.setStringList('cart', cartItemsJson);
  }
}
