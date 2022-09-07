import 'dart:io';

import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/admin/data/model/order_model.dart';
import 'package:amazon_clone/features/admin/data/model/product_model.dart';
import 'package:dartz/dartz.dart';

import '../model/earning_model.dart';

abstract class AdminServicesDataSource {
  Future<Either<Failure, String>> sellProduct(
    String token,
    String name,
    String description,
    double price,
    double quantity,
    String category,
    List<File> images,
  );
  Future<Either<Failure, Earning>> getEarnings(
    String token,
  );
  Future<Either<Failure, String>> changeOrderStatus(
      int status,
      OrderModel order,
      String token,
      );
  Future<Either<Failure, List<ProductModel>>> fetchAllProducts(String token);
  Future<Either<Failure, String>> deleteProduct(
      String token, ProductModel productModel);
  Future<Either<Failure, List<OrderModel>>> fetchAllOrders(String token);
}
