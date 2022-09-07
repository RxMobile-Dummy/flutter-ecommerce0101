import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';

abstract class AuthServiceRepository {
  Future<Either<Failure, UserEntity>> signInUser(String email, String password,String userType);

  Future<Either<Failure, String>> signUpUser(
      String email, String password, String name,String userType);

  Future<Either<Failure, UserEntity>> getUserData();
}
