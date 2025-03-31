import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/logic/blocs/cart_bloc/cart_event.dart';
import 'package:shopping_cart/presentation/widgets/cart_icon.dart';
import 'package:shopping_cart/presentation/widgets/product_card.dart';

import '../../logic/blocs/cart_bloc/cart_bloc.dart';
import '../../logic/blocs/cart_bloc/cart_state.dart';
import '../../logic/blocs/product_bloc/procduct_state.dart';
import '../../logic/blocs/product_bloc/product_bloc.dart';
import '../../logic/blocs/product_bloc/product_event.dart';

// product_page.dart

class ProductPage extends StatefulWidget {
  ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  void initState() {
    super.initState();
    // Access the ProductBloc using context.read() and add the event
    context.read<ProductBloc>().add(FetchProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: const Text("Cataloue")),
        actions: [
          BlocBuilder<CartBloc, CartState>(
            builder: (context, state) {
              int itemCount = state.totalItems;

              return CartIcon(
                itemCount: itemCount,
                onPressed: () {
                  Navigator.pushNamed(context, '/cart');
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductError) {
            return Center(child: Text("Error: ${state.message}"));
          } else if (state is ProductLoaded) {
            final products = state.products;
            if (products.isEmpty) {
              return const Center(child: Text("No products available"));
            }

            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  imageUrl: product.thumbnail,
                  title: product.title,
                  productName: product.brand,
                  price: product.price.toString(),
                  discountPrice: (product.discountPercentage.roundToDouble() *
                          product.price)
                      .toStringAsFixed(2),
                  discount: product.discountPercentage.toStringAsFixed(2),
                  addToCart: () {
                    context.read<CartBloc>().add(AddToCart(product));
                  },
                );
              },
            );
          }
          return const Center(child: Text("Unexpected state"));
        },
      ),
    );
  }
}
