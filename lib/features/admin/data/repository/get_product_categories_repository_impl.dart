import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/admin/data/datasource/get_product_categories_datasource.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/get_product_categories_repository.dart';

class GetProductCategoriesRepositoryImpl
    extends GetProductCategoriesRepository {
  final GetProductCategoriesDataSource getProductCategoriesDataSource;

  GetProductCategoriesRepositoryImpl(
      {required this.getProductCategoriesDataSource});

  @override
  Future<Either<Failure, List<String>>> getProductCategories() async =>
      await getProductCategoriesDataSource.getProductCategories();

 }
