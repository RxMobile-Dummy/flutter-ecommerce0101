import 'package:amazon_clone/base/error/failures.dart';

import 'package:dartz/dartz.dart';

import 'auth_manage_datasource.dart';

enum Auth { signup, signin }

class AuthManageDataSourceImpl extends AuthManageDataSource {
  Auth _auth = Auth.signup;

  @override
  Future<Either<Failure, Auth>> authManage(Auth auth) {
    _auth = auth;
    return Future.value(Right(_auth));
  }
}
