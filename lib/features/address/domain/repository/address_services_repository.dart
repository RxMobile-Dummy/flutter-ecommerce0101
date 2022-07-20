import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AddressServicesRepository {
  Future<Either<Failure, UserEntity>> saveUserAddress(
      String address, UserEntity userModel);
  Future<Either<Failure, String>> deleteProduct(String productId, String token);
  // get all the products
  Future<Either<Failure, UserEntity>> placeOrder(
      String address, double totalSum, UserEntity userModel);
}
