import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

class CartEntity extends Equatable {
  final ProductEntity? productEntity;
  final int? quantity;

  const CartEntity({this.productEntity, this.quantity});

  @override
  List<Object?> get props => [productEntity, quantity];
}
