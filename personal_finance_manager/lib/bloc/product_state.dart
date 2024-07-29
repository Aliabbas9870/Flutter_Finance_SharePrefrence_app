import 'package:equatable/equatable.dart';
import 'package:personal_finance_manager/model/product_model.dart';


abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get probs => [];
}

abstract class ProductsInitial extends ProductState {
  
  // List<Object?> get props => throw UnimplementedError();
}

class ProductLoadingState extends ProductState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class ProductLoadedState extends ProductState {
  final List<ProductsModel> productModel;

  ProductLoadedState({required this.productModel});
  @override

  List<Object?> get props => [productModel];
}

class ProductErrorState extends ProductState {
   final String ErrorMessage;

  ProductErrorState({required this.ErrorMessage});
  List<Object?> get props => [ErrorMessage];

}
