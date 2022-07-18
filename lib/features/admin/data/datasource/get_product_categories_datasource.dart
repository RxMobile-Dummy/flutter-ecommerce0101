import 'package:amazon_clone/base/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class GetProductCategoriesDataSource{
  Future<Either<Failure,List<String>>> getProductCategories();
}