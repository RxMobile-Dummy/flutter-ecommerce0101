import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../../data/datasource/auth_manage_datasource_impl.dart';

abstract class AuthManageRepository {
  Future<Either<Failure, Auth>> authManage(Auth auth);
}
