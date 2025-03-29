import 'package:flutter/material.dart';

import '../widgets/cart_product_card.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  int itemCount = 2;
  double pricePerItem = 150.0;
  final List<Map<String, String>> products = [
    {
      'productName': 'iPhone 9',
      'title': 'Stylish Shoes',
      'price': '\$50',
      'imageUrl': 'https://via.placeholder.com/100',
      'discountPrice': '\$47',
      'discount': '12.3\%',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice = itemCount * pricePerItem;

    return Scaffold(
      backgroundColor: Colors.pink.shade100,
      appBar: AppBar(
        title: Text("Cart", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  CartProductCard(
                    imageUrl: "https://via.placeholder.com/100",
                    title: "Stylish Jacket",
                    price: "\$33.99",
                    productName: 'Apple',
                    discountPrice: '\$22.00',
                    discount: '12.4\%',
                  ),
                  CartProductCard(
                    imageUrl: "https://via.placeholder.com/100",
                    title: "Stylish Jacket",
                    price: "\$33.99",
                    productName: 'Apple',
                    discountPrice: '\$22.00',
                    discount: '12.4\%',
                  ),
                  CartProductCard(
                    imageUrl: "https://via.placeholder.com/100",
                    title: "Stylish Jacket",
                    price: "\$33.99",
                    productName: 'Apple',
                    discountPrice: '\$22.00',
                    discount: '12.4\%',
                  ),
                ],
              ),
            ),

            // Bottom Total & Checkout Section
            Card(
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Total Price
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amount Price",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "\$$totalPrice",
                            style: TextStyle(
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
                        padding: EdgeInsets.symmetric(
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
                        "Checkout ($itemCount)",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
