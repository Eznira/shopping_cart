import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_cart/logic/blocs/product_bloc/procduct_state.dart';

import '../../../data/repo/repo.dart';
import 'product_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  late final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductLoading()) {
    on<FetchProducts>((event, emit) async {
      try {
        final products = await repository.getProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}
