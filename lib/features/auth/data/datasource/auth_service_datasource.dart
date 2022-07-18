import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../model/user_model.dart';

abstract class AuthServiceDataSource {
  Future<Either<Failure, String>> signUpUser(
      String email, String password, String name);
  Future<Either<Failure, UserModel>> signInUser(String email, String password);

  Future<Either<Failure, UserModel>> getUserData();
}
