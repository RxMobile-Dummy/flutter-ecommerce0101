import 'package:amazon_clone/base/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../admin/domain/entity/product_entity.dart';

abstract class HomeServicesRepository {
  Future<Either<Failure, List<ProductEntity>>> fetchCategoryProducts(
      String category, String token);
  Future<Either<Failure, ProductEntity>> fetchDealOfDay(String token);
}
