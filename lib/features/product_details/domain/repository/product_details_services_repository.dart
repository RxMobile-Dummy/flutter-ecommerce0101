import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductDetailsServicesRepository {
  Future<Either<Failure, UserEntity>> addToCart(
      String productId, UserEntity userEntity);
  Future<Either<Failure, String>> rateProduct(
      String productId, double rating, String token);
}
