import '../../../admin/data/model/product_model.dart';
import '../../domain/entity/cart_entity.dart';

class CartModel extends CartEntity {
  const CartModel({super.productEntity, super.quantity});

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      quantity: map['quantity'] ?? 0,
      productEntity: ProductModel.fromMap(map['product']),
    );
  }

  CartModel copyWith({
    ProductModel? productEntity,
    int? quantity,
  }) {
    return CartModel(
        quantity: this.quantity ?? quantity,
        productEntity: this.productEntity ?? productEntity);
  }
}
