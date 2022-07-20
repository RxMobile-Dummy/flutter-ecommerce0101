import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/auth/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductDetailsServicesDataSource {
  Future<Either<Failure, UserModel>> addToCart(
      String productId, UserModel userModel);
  Future<Either<Failure, String>> rateProduct(
      String productId, double rating, String token);
}
