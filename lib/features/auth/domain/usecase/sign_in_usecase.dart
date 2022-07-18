import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';
import 'package:amazon_clone/features/auth/domain/repository/auth_service_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SignInUseCase extends UseCase<UserEntity, Params2> {
  final AuthServiceRepository authServiceRepository;

  SignInUseCase({required this.authServiceRepository});

  @override
  Future<Either<Failure, UserEntity>?>? call(Params2 params) async =>
      await authServiceRepository.signInUser(params.email, params.password);
}

class Params2 extends Equatable {
  final String email;
  final String password;

  const Params2(this.email, this.password);

  @override
  List<Object?> get props => [email, password];
}
