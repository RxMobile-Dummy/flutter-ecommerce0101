import 'dart:io';

import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/admin/data/datasource/admin_services_datasource.dart';
import 'package:amazon_clone/features/admin/data/model/product_model.dart';
import 'package:amazon_clone/features/admin/domain/entity/order_entity.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/admin_services_repository.dart';

class AdminServicesRepositoryImpl extends AdminServicesRepository {
  final AdminServicesDataSource adminServicesDataSource;

  AdminServicesRepositoryImpl({required this.adminServicesDataSource});

  @override
  Future<Either<Failure, String>> sellProduct(
          String token,
          String name,
          String description,
          double price,
          double quantity,
          String category,
          List<File> images) async =>
      await adminServicesDataSource.sellProduct(
          token, name, description, price, quantity, category, images);

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchAllProducts(
          String token) async =>
      await adminServicesDataSource.fetchAllProducts(token);

  @override
  Future<Either<Failure, String>> deleteProduct(
          String token, ProductEntity productEntity) async =>
      await adminServicesDataSource.deleteProduct(
          token, productEntity as ProductModel);

  @override
  Future<Either<Failure, List<OrderEntity>>> fetchAllOrders(
          String token) async =>
      await adminServicesDataSource.fetchAllOrders(token);
}
