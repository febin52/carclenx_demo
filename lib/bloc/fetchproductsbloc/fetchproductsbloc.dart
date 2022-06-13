import 'dart:async';

import 'package:carclenx_demo/bloc/fetchproductsbloc/fetchproductsevent.dart';
import 'package:carclenx_demo/bloc/fetchproductsbloc/fetchproductstate.dart';
import 'package:carclenx_demo/data/models/products_list_model.dart';
import 'package:carclenx_demo/data/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  GetProductsBloc() : super(ProductsState()) {
    on<GetProducts>(_getProducts);
  }

  Future<FutureOr<void>> _getProducts(
      GetProducts event, Emitter<ProductsState> emit) async {
    emit(ViewingProduct());
    ProductsListModel productsListModel;

    productsListModel =
        await Repository().fetchProducts(url: '/v1.0/product/vendor/1');
    if (productsListModel.status == 'OK') {
      emit(ProductsSuccess(productsListModel:productsListModel));
    } else {
      emit(ProductsError(error:productsListModel.message));
    }
  }
}
