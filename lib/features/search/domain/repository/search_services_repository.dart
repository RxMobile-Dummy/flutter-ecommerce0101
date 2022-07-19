import 'package:amazon_clone/base/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../admin/domain/entity/product_entity.dart';

abstract class SearchServicesRepository {
  Future<Either<Failure, List<ProductEntity>>> fetchSearchedProduct(
      String searchQuery, String token);
}
