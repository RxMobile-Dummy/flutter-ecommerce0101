import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/address_services_repository.dart';
import 'delete_product_usecase.dart';

class PlaceOrderUseCase extends UseCase<UserEntity, Params9> {
  final AddressServicesRepository addressServicesRepository;

  PlaceOrderUseCase({required this.addressServicesRepository});

  @override
  Future<Either<Failure, UserEntity>?>? call(Params9 params) async =>
      await addressServicesRepository.placeOrder(
          params.address!, params.totalSum!, params.userEntity);
}
