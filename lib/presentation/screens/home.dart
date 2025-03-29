import 'package:flutter/material.dart';
import 'package:shopping_cart/presentation/widgets/cart_icon.dart';

import '../widgets/product_card.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    //demo products
    final List<Map<String, String>> products = [
      {
        'productName': 'iPhone 9',
        'title': 'Stylish Shoes',
        'price': '\$50',
        'imageUrl': 'https://via.placeholder.com/100',
        'discountPrice': '\$47',
        'discount': '12.3\%',
      },
      {
        'productName': 'iPhone 9',
        'title': 'Stylish Shoes',
        'price': '\$50',
        'imageUrl': 'https://via.placeholder.com/100',
        'discountPrice': '\$47',
        'discount': '12.3\%',
      },
      {
        'productName': 'iPhone 9',
        'title': 'Stylish Shoes',
        'price': '\$50',
        'imageUrl': 'https://via.placeholder.com/100',
        'discountPrice': '\$47',
        'discount': '12.3\%',
      },
      {
        'productName': 'iPhone 9',
        'title': 'Stylish Shoes',
        'price': '\$50',
        'imageUrl': 'https://via.placeholder.com/100',
        'discountPrice': '\$47',
        'discount': '12.3\%',
      },
      {
        'productName': 'iPhone 9',
        'title': 'Stylish Shoes',
        'price': '\$50',
        'imageUrl': 'https://via.placeholder.com/100',
        'discountPrice': '\$47',
        'discount': '12.3\%',
      },
      {
        'productName': 'iPhone 9',
        'title': 'Stylish Shoes',
        'price': '\$50',
        'imageUrl': 'https://via.placeholder.com/100',
        'discountPrice': '\$47',
        'discount': '12.3\%',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(
        title: Center(child: const Text("Catalogue")),
        backgroundColor: Colors.transparent,
        actions: [
          CartIcon(
            itemCount: 2,
            onPressed: () {
              // TODO: implement navigation to cart page
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.6,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ProductCard(
                imageUrl: product["imageUrl"]!,
                title: product["title"]!,
                price: product["price"]!,
                discount: product["discount"]!,
                discountPrice: product["discountPrice"]!,
                productName: product["productName"]!,
              );
            },
          ),
        ),
      ),
    );
  }
}
