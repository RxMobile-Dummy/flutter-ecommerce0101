import 'dart:convert';

import 'package:amazon_clone/features/admin/data/model/product_model.dart';
import 'package:amazon_clone/features/admin/domain/entity/order_entity.dart';

class OrderModel extends OrderEntity {
  final String id;
  final List<ProductModel> products;
  final List<int> quantity;
  final String address;
  final String userId;
  final int orderedAt;
  final int status;
  final double totalPrice;

  const OrderModel({
    required this.id,
    required this.products,
    required this.quantity,
    required this.address,
    required this.userId,
    required this.orderedAt,
    required this.status,
    required this.totalPrice,
  }) : super(
            id: id,
            address: address,
            status: status,
            userId: userId,
            orderedAt: orderedAt,
            products: products,
            quantity: quantity,
            totalPrice: totalPrice);

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'products': products.map((x) => x.toMap()).toList(),
      'quantity': quantity,
      'address': address,
      'userId': userId,
      'orderedAt': orderedAt,
      'status': status,
      'totalPrice': totalPrice,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['_id'] ?? '',
      products: List<ProductModel>.from(
          map['products']?.map((x) => ProductModel.fromMap(x['product']))),
      quantity: List<int>.from(
        map['products']?.map(
          (x) => x['quantity'],
        ),
      ),
      address: map['address'] ?? '',
      userId: map['userId'] ?? '',
      orderedAt: map['orderedAt']?.toInt() ?? 0,
      status: map['status']?.toInt() ?? 0,
      totalPrice: map['totalPrice']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));
}
