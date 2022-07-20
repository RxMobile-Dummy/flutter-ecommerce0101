import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/home_services_repository.dart';
import '../datasource/home_services_datasource.dart';

class HomeServicesRepositoryImpl extends HomeServicesRepository {
  final HomeServicesDataSource homeServicesDataSource;

  HomeServicesRepositoryImpl({required this.homeServicesDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchCategoryProducts(
          String category, String token) async =>
      await homeServicesDataSource.fetchCategoryProducts(category, token);

  @override
  Future<Either<Failure, ProductEntity>> fetchDealOfDay(String token) async =>
      await homeServicesDataSource.fetchDealOfDay(token);
}
