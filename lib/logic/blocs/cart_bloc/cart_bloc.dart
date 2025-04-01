import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/product_model.dart';
import 'cart_event.dart';
import 'cart_state.dart';

// cart_bloc.dart

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(cartItems: {}, totalItems: 0, totalPrice: 0.0)) {
    //handle AddToCart event
    on<AddToCart>((event, emit) {
      //update CartItems
      // add to cart
      final updatedCart = Map<Product, int>.from(state.cartItems);
      updatedCart.update(
        event.product,
        (quantity) => quantity + 1,
        ifAbsent: () => 1,
      );

      // sum up cartItem quantity
      final totalItems = updatedCart.values.fold(
        0,
        (sum, quantity) => sum + quantity,
      );

      // calculate and sum up prices
      final totalPrice = updatedCart.entries.fold(
        0.0,
        (sum, entry) => sum + entry.key.discountPrice * entry.value,
      );

      // update cartState
      emit(
        state.copyWith(
          cartItems: updatedCart,
          totalItems: totalItems,
          totalPrice: totalPrice,
        ),
      );
    });

    // remove from cart
    on<RemoveFromCart>((event, emit) {
      final updatedCart = Map<Product, int>.from(state.cartItems);
      if (updatedCart.containsKey(event.product)) {
        if (updatedCart[event.product]! > 1) {
          updatedCart[event.product] = updatedCart[event.product]! - 1;
        } else {
          updatedCart.remove(event.product);
        }
      }

      final totalItems = updatedCart.values.fold(
        0,
        (sum, quantity) => sum + quantity,
      );
      final totalPrice = updatedCart.entries.fold(
        0.0,
        (sum, entry) => sum + entry.key.discountPrice * entry.value,
      );

      emit(
        state.copyWith(
          cartItems: updatedCart,
          totalItems: totalItems,
          totalPrice: totalPrice,
        ),
      );
    });
  }
}
