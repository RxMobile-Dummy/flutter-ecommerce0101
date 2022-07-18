import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';

abstract class AuthServiceRepository {
  Future<Either<Failure, UserEntity>> signInUser(String email, String password);

  Future<Either<Failure, String>> signUpUser(
      String email, String password, String name);

  Future<Either<Failure, UserEntity>> getUserData();
}
