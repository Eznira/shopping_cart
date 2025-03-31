import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/blocs/cart_bloc/cart_bloc.dart';
import '../../logic/blocs/cart_bloc/cart_event.dart';
import '../../logic/blocs/cart_bloc/cart_state.dart';
import '../widgets/cart_product_card.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(
        title: const Text("Cart"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state.cartItems.isEmpty) {
                    return const Center(child: Text("Your cart is empty"));
                  }

                  return ListView(
                    children:
                        state.cartItems.entries.map((entry) {
                          final product = entry.key;
                          final quantity = entry.value;

                          return CartProductCard(
                            imageUrl: product.images[1],
                            title: product.brand,
                            price: "\$${product.price}",
                            productName: product.title,
                            discountPrice:
                                "\$${(product.price * 0.9).toStringAsFixed(2)}",
                            discount: "10%",
                            quantity: quantity,
                            onAdd: () {
                              context.read<CartBloc>().add(AddToCart(product));
                            },
                            onRemove: () {
                              context.read<CartBloc>().add(
                                RemoveFromCart(product),
                              );
                            },
                          );
                        }).toList(),
                  );
                },
              ),
            ),

            // Bottom Total & Checkout Section
            BlocBuilder<CartBloc, CartState>(
              builder: (context, state) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Total Price
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Amount Price",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                "\$${state.totalPrice.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Checkout Button
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 14,
                              vertical: 20,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            // Handle checkout
                          },
                          child: Text(
                            "Checkout (${state.totalItems})",
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
