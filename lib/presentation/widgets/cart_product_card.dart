import 'package:flutter/material.dart';

class CartProductCard extends StatefulWidget {
  final String imageUrl;
  final String title;
  final String productName;
  final String price;
  final String discount;
  final String discountPrice;

  const CartProductCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.productName,
    required this.price,
    required this.discountPrice,
    required this.discount,
  });

  @override
  _CartProductCardState createState() => _CartProductCardState();
}

class _CartProductCardState extends State<CartProductCard> {
  int quantity = 1;

  void _increment() {
    setState(() {
      quantity++;
    });
  }

  void _decrement() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(.0),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Product Image (Left)
                  SizedBox(
                    height: 120,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        widget.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: 12),

                  // Product Details (Right)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            widget.productName,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            children: [
                              Text(
                                widget.price,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                widget.discountPrice,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            children: [
                              Text(
                                widget.discount,

                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 2),
                              Text(
                                "OFF",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.pink,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 6,
                right: 6,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 2,
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: _decrement,
                          child: Container(
                            width: 18, // Adjust size
                            height: 18,
                            decoration: BoxDecoration(
                              color: Colors.transparent, // Background color
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.remove,
                              size: 12, // Adjust icon size
                            ),
                          ),
                        ),
                        SizedBox(width: 6), // Space between elements
                        Text(
                          quantity.toString(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                        SizedBox(width: 6), // Space between elements
                        GestureDetector(
                          onTap: _increment,
                          child: Container(
                            width: 18, // Adjust size
                            height: 18,
                            decoration: BoxDecoration(
                              color: Colors.transparent, // Background color
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.add,
                              size: 12, // Adjust icon size
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Quantity Control (Bottom-Right)
            ],
          ),
        ),
      ),
    );
  }
}
