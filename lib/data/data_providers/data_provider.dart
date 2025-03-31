// product_data_provider.dart
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopping_cart/constants/constants.dart' as appConst;

class ProductDataProvider {
  final String apiUrl = appConst.apiUrl;

  Future<Map<String, dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load products");
    }
  }
}
