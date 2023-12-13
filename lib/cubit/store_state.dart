part of 'store_cubit.dart';

enum StoreStatus { initial, loading, success, failed }

class StoreState {
  const StoreState({
    this.products = const [],
    this.productsStatus = StoreStatus.initial,
    this.cartsStatus = StoreStatus.initial,
    this.cart = const [],
  });

  final List<Product> products;
  final StoreStatus productsStatus;
  final StoreStatus cartsStatus;
  final List<CartItem> cart;

  StoreState copyWith({
    List<Product>? products,
    StoreStatus? productsStatus,
    List<CartItem>? cart,
    StoreStatus? cartsStatus,
  }) =>
      StoreState(
        products: products ?? this.products,
        productsStatus: productsStatus ?? this.productsStatus,
        cart: cart ?? this.cart,
        cartsStatus: cartsStatus ?? this.cartsStatus,
      );
}
