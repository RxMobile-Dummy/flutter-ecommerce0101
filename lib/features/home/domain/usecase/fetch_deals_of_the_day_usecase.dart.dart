import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../admin/domain/usecase/fetch_all_products_usecase.dart';
import '../repository/home_services_repository.dart';

class FetchDealsOfTheDayUseCase extends UseCase<ProductEntity, Params5> {
  final HomeServicesRepository homeServicesRepository;

  FetchDealsOfTheDayUseCase({required this.homeServicesRepository});

  @override
  Future<Either<Failure, ProductEntity>?>? call(params) async =>
      await homeServicesRepository.fetchDealOfDay(params.token);
}
