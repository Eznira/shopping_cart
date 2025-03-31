import 'package:flutter/material.dart';

class CartIcon extends StatelessWidget {
  final int itemCount;
  final VoidCallback onPressed;

  const CartIcon({Key? key, required this.itemCount, required this.onPressed})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        children: [
          Container(
            width: 30,
            height: 30,
            child: const Icon(Icons.shopping_cart_outlined, size: 24),
          ),
          if (itemCount > 0)
            Positioned(
              right: 1,
              top: 1,
              child: GestureDetector(
                onTap: onPressed,
                child: Container(
                  width: 16,
                  height: 16,
                  padding: const EdgeInsets.all(2),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$itemCount',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
