import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';

abstract class GetProductCategoriesRepository{
  Future<Either<Failure,List<String>>> getProductCategories();
 }