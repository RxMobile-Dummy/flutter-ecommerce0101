import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../../product_details/domain/usecase/add_to_cart_usecase.dart';
import '../repository/cart_services_repository.dart';

class RemoveFromCartUseCase extends UseCase<UserEntity, Params8> {
  final CartServicesRepository cartServicesRepository;

  RemoveFromCartUseCase({required this.cartServicesRepository});

  @override
  Future<Either<Failure, UserEntity>?>? call(Params8 params) async =>
      await cartServicesRepository.removeFromCart(
          params.productId!, params.userEntity);
}
