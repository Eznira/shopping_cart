import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/data/data_providers/data_provider.dart';
import 'package:shopping_cart/data/repo/repo.dart';
import 'package:shopping_cart/logic/blocs/cart_bloc/cart_bloc.dart';
import 'package:shopping_cart/logic/blocs/product_bloc/product_bloc.dart';
import 'package:shopping_cart/presentation/screens/cart.dart';
import 'package:shopping_cart/presentation/screens/product_page.dart';

final productDataProvider = ProductDataProvider();
final repo = ProductRepository(productDataProvider);

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductBloc(repo)),
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: const MyApp(),
    ),
  );
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
      routes: {'/': (context) => ProductPage(), '/cart': (context) => Cart()},
    );
  }
}
