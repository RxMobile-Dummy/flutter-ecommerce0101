import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../data/datasource/auth_manage_datasource_impl.dart';
import '../repository/auth_manage_repository.dart';

class AuthManageUseCase extends UseCase<Auth,Params>{
  final AuthManageRepository authManageRepository;

  AuthManageUseCase({required this.authManageRepository});

  @override
  Future<Either<Failure, Auth>?>? call(Params params) {
   return authManageRepository.authManage(params.auth);
  }

}
class Params extends Equatable{
  final Auth auth;
  const Params({required this.auth});

  @override
  List<Object?> get props => [auth];
}