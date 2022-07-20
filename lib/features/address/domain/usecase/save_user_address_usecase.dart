import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../auth/domain/entity/user_entity.dart';
import '../repository/address_services_repository.dart';
import 'delete_product_usecase.dart';

class SaveUserAddressUseCase extends UseCase<UserEntity, Params9> {
  final AddressServicesRepository addressServicesRepository;

  SaveUserAddressUseCase({required this.addressServicesRepository});

  @override
  Future<Either<Failure, UserEntity>?>? call(Params9 params) async =>
      await addressServicesRepository.saveUserAddress(
          params.address!, params.userEntity);
}
