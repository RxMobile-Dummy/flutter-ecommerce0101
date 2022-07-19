

import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entity/product_entity.dart';
import '../repository/admin_services_repository.dart';

class DeleteProductUseCase extends UseCase<String, Params6> {
  final AdminServicesRepository adminServicesRepository;

  DeleteProductUseCase({required this.adminServicesRepository});

  @override
  Future<Either<Failure, String>?>? call(params) async =>
      await adminServicesRepository.deleteProduct(
          params.token,params.productEntity);
}

class Params6 extends Equatable {
  final String token;
  final ProductEntity productEntity;

  const Params6(
      {required this.token,
      required this.productEntity,});

  @override
  List<Object?> get props =>
      [token, productEntity];
}
