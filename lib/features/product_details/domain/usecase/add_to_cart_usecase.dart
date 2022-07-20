import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';
import 'package:amazon_clone/features/product_details/domain/repository/product_details_services_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AddToCartUseCase extends UseCase<UserEntity, Params8> {
  final ProductDetailsServicesRepository productDetailsServicesRepository;

  AddToCartUseCase({required this.productDetailsServicesRepository});

  @override
  Future<Either<Failure, UserEntity>?>? call(Params8 params) async {
    return await productDetailsServicesRepository.addToCart(
        params.productId!, params.userEntity);
  }
}

class Params8 extends Equatable {
  final String? productId;
  final double? rating;
  final UserEntity userEntity;
  const Params8({required this.userEntity, this.productId, this.rating});

  @override
  List<Object?> get props => [productId, rating, userEntity];
}
