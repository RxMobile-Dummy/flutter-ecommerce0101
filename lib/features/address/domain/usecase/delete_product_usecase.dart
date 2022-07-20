import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/address/domain/repository/address_services_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../auth/domain/entity/user_entity.dart';

class DeleteProductUseCase extends UseCase<String, Params9> {
  final AddressServicesRepository addressServicesRepository;

  DeleteProductUseCase({required this.addressServicesRepository});

  @override
  Future<Either<Failure, String>?>? call(Params9 params) async =>
      await addressServicesRepository.deleteProduct(
          params.productId!, params.userEntity.token!);
}

class Params9 extends Equatable {
  final String? productId;
  final UserEntity userEntity;
  final String? address;
  final double? totalSum;

  const Params9(
      {this.address, this.totalSum, required this.userEntity, this.productId});

  @override
  List<Object?> get props => [productId, userEntity, address, totalSum];
}
