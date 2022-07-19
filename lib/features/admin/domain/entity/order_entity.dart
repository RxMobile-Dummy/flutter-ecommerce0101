import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String? id;
  final List<ProductEntity?>? products;
  final List<int>? quantity;
  final String? address;
  final String? userId;
  final int? orderedAt;
  final int? status;
  final double? totalPrice;

  const OrderEntity(
      {this.id,
      this.products,
      this.quantity,
      this.address,
      this.userId,
      this.orderedAt,
      this.status,
      this.totalPrice});

  @override
  List<Object?> get props =>
      [id, products, quantity, address, userId, orderedAt, status, totalPrice];
}
