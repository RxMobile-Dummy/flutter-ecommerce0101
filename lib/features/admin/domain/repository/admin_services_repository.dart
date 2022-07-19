import 'dart:io';

import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/admin/domain/entity/order_entity.dart';
import 'package:dartz/dartz.dart';

import '../entity/product_entity.dart';

abstract class AdminServicesRepository {
  Future<Either<Failure, String>> sellProduct(
    String token,
    String name,
    String description,
    double price,
    double quantity,
    String category,
    List<File> images,
  );

  Future<Either<Failure, String>> deleteProduct(
      String token, ProductEntity productEntity);
  Future<Either<Failure, List<OrderEntity>>> fetchAllOrders(String token);

  Future<Either<Failure, List<ProductEntity>>> fetchAllProducts(String token);
}
