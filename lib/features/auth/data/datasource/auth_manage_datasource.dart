import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import 'auth_manage_datasource_impl.dart';

abstract class AuthManageDataSource {
  Future<Either<Failure, Auth>> authManage(Auth auth);
}
