

import 'package:amazon_clone/base/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class ProductDetailsServicesDataSource {
  Future<Either<Failure, String>> addToCart(String productId);
  Future<Either<Failure, String>> rateProduct(String productId, double rating);
}
