import 'package:flutter/material.dart';
import 'package:shopping_cart/presentation/screens/cart.dart';
import 'package:shopping_cart/presentation/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routes: {
        '/': (context) => Home(title: 'Catalogue'),
        '/cart': (context) => Cart(),
      },
    );
  }
}

class HomePage {}
