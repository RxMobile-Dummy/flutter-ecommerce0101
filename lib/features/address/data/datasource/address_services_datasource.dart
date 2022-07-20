import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../../../auth/data/model/user_model.dart';

abstract class AddressServicesDataSource {
  Future<Either<Failure, UserModel>> saveUserAddress(
      String address, UserModel userModel);
  Future<Either<Failure, String>> deleteProduct(String productId, String token);

  // get all the products
  Future<Either<Failure, UserModel>> placeOrder(
      String address, double totalSum, UserModel userModel);
}
