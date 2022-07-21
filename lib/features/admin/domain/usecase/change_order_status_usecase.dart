import 'dart:io';

import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../entity/order_entity.dart';
import '../repository/admin_services_repository.dart';

class ChangeOrderStatusUseCase extends UseCase<String, Params11> {
  final AdminServicesRepository adminServicesRepository;

  ChangeOrderStatusUseCase({required this.adminServicesRepository});

  @override
  Future<Either<Failure, String>?>? call(params) async =>
      await adminServicesRepository.changeOrderStatus(
          params.status, params.orderEntity, params.token);
}

class Params11 extends Equatable {
  final String token;
  final int status;
  final OrderEntity orderEntity;

  const Params11(
      {required this.token, required this.status, required this.orderEntity});

  @override
  List<Object?> get props => [token, status, orderEntity];
}
