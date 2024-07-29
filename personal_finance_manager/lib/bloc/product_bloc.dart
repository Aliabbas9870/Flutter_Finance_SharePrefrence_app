import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:personal_finance_manager/bloc/product_event.dart';
import 'package:personal_finance_manager/bloc/product_state.dart';
import 'package:personal_finance_manager/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductBloc extends Bloc<ProductLoadedState, ProductState> {
  ProductBloc() : super(ProductLoadingState()) {
    on<ProductLoadedState>(
      (event, emit) async {
        try {
          emit(ProductLoadingState());

          var response =
              await http.get(Uri.parse('https://fakestoreapi.com/products'));
          if (response.statusCode == 200) {
            emit(ProductLoadedState(
                productModel: productsModelFromJson(response.body)));
          } else {
            throw Exception("Failed to Load");
          }
        } catch (e) {
          emit(ProductErrorState(ErrorMessage: e.toString()));
        }
      },
    );
  }
}
