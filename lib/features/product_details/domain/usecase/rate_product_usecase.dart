import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/product_repository_services_repository.dart';
import 'add_to_cart_usecase.dart';

class RateToProductUseCase extends UseCase<String, Params8> {
  final ProductDetailsServicesRepository productDetailsServicesRepository;

  RateToProductUseCase({required this.productDetailsServicesRepository});

  @override
  Future<Either<Failure, String>?>? call(Params8 params) async {
    return await productDetailsServicesRepository.rateProduct(
        params.productId!, params.rating!);
  }
}
