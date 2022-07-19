import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/search_services_repository.dart';
import '../datasource/search_services_datasource.dart';

class SearchServicesRepositoryImpl extends SearchServicesRepository {
  final SearchServicesDataSource searchServicesDataSource;

  SearchServicesRepositoryImpl({required this.searchServicesDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> fetchSearchedProduct(
          String searchQuery, String token) async =>
      await searchServicesDataSource.fetchSearchedProduct(searchQuery, token);
}
