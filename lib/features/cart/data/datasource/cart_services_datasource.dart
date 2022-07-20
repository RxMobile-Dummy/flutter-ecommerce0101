import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/auth/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class CartServicesDataSource {
  Future<Either<Failure, UserModel>> removeFromCart(
      String productId, UserModel userModel);
}
