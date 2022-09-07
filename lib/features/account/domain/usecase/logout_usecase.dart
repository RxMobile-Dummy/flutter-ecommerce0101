
import 'package:dartz/dartz.dart';
import '../../../../base/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/account_services_repository.dart';

class LogoutUseCase extends UseCase<String, NoParams> {
  final AccountServicesRepository accountServicesRepository;

  LogoutUseCase({required this.accountServicesRepository});

  @override
  Future<Either<Failure, String>?>? call(params) async =>
      await accountServicesRepository.logOut();
}
