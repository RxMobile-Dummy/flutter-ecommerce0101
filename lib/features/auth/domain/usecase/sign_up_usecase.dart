import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:amazon_clone/features/auth/domain/repository/auth_service_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SignUpUseCase extends UseCase<String, Params1> {
  final AuthServiceRepository authServiceRepository;

  SignUpUseCase({required this.authServiceRepository});

  @override
  Future<Either<Failure, String>?>? call(Params1 params) =>
      authServiceRepository.signUpUser(
          params.email, params.password, params.name);
}

class Params1 extends Equatable{
  final String email;
  final String name;
  final String password;

  const Params1(this.email, this.name, this.password);

  @override
  List<Object?> get props => [email,name,password];
}
