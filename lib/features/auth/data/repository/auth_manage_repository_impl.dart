import 'package:amazon_clone/base/error/failures.dart';

import 'package:amazon_clone/features/auth/data/datasource/auth_manage_datasource_impl.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/auth_manage_repository.dart';
import '../datasource/auth_manage_datasource.dart';

class AuthManageRepositoryImpl extends AuthManageRepository {
  final AuthManageDataSource authManageDataSource;

  AuthManageRepositoryImpl({required this.authManageDataSource});

  @override
  Future<Either<Failure, Auth>> authManage(Auth auth) =>
      authManageDataSource.authManage(auth);
}
