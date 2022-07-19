import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';

abstract class GetProductCategoriesRepository {
  Future<Either<Failure, List<String>>> getProductCategories();
}
