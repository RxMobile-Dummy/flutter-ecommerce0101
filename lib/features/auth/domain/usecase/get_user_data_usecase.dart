import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entity/user_entity.dart';
import '../repository/auth_service_repository.dart';

class GetUserDataUseCase extends UseCase<UserEntity, NoParams> {
  final AuthServiceRepository authServiceRepository;

  GetUserDataUseCase({required this.authServiceRepository});

  @override
  Future<Either<Failure, UserEntity>?>? call(NoParams params) async =>
      await  authServiceRepository.getUserData();
}