import '../data_providers/data_provider.dart';
import '../models/product_model.dart';

class ProductRepository {
  final ProductDataProvider dataProvider;

  ProductRepository(this.dataProvider);

  Future<List<Product>> getProducts() async {
    final rawJson = await dataProvider.fetchProducts();
    final List<dynamic> productsJson = rawJson['products'];
    return productsJson.map((json) => Product.fromJson(json)).toList();
  }
}
