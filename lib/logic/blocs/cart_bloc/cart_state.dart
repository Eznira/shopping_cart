import '../../../data/models/product_model.dart';

class CartState {
  final Map<Product, int> cartItems;
  final int totalItems;
  final double totalPrice;

  CartState({
    required this.cartItems,
    required this.totalItems,
    required this.totalPrice,
  });

  CartState copyWith({
    Map<Product, int>? cartItems,
    int? totalItems,
    double? totalPrice,
  }) {
    return CartState(
      cartItems: cartItems ?? this.cartItems,
      totalItems: totalItems ?? this.totalItems,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
