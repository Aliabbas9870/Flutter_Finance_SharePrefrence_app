import 'package:equatable/equatable.dart';

abstract class ProductEvent extends Equatable {
  ProductEvent();

  @override
  @override
  List<Object> get probs => [];
}

class ProductLoadedEvent extends Equatable {
  @override
  List<Object?> get props => [];
}
