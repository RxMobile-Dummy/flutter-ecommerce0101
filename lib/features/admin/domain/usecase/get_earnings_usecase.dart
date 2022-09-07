import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:amazon_clone/features/admin/data/model/earning_model.dart';
import 'package:dartz/dartz.dart';

import '../repository/admin_services_repository.dart';
import 'fetch_all_products_usecase.dart';

class GetEarningsUseCase extends UseCase<Earning, Params5> {
  final AdminServicesRepository adminServicesRepository;

  GetEarningsUseCase({required this.adminServicesRepository});

  @override
  Future<Either<Failure, Earning>?>? call(params) async =>
      await adminServicesRepository.getEarnings(params.token);
}
