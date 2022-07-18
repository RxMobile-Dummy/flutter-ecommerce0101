import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/auth/data/datasource/auth_service_datasource.dart';
import 'package:amazon_clone/features/auth/data/model/user_model.dart';
import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/auth_service_repository.dart';

class AuthServiceRepositoryImpl extends AuthServiceRepository {
  final AuthServiceDataSource authServiceDataSource;

  AuthServiceRepositoryImpl({required this.authServiceDataSource});

  @override
  Future<Either<Failure, String>> signUpUser(
          String email, String password, String name) async =>
      await authServiceDataSource.signUpUser(email, password, name);

  @override
  Future<Either<Failure, UserModel>> signInUser(
          String email, String password) async =>
      await authServiceDataSource.signInUser(email, password);

  @override
  Future<Either<Failure, UserEntity>> getUserData() async =>
      await authServiceDataSource.getUserData();
}
