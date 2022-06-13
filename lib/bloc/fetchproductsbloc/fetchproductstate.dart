import 'package:carclenx_demo/data/models/products_list_model.dart';
import 'package:equatable/equatable.dart';

class ProductsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductsInitial extends ProductsState {}

class ViewingProduct extends ProductsState {}

class ProductsSuccess extends ProductsState {
  ProductsSuccess({this.productsListModel});

  @override
  List<Object> get props => [];
  final ProductsListModel? productsListModel;
}

class ProductsEmpty extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsError extends ProductsState {
  ProductsError({this.error});

  @override
  List<Object> get props => [];
  final String? error;
}
