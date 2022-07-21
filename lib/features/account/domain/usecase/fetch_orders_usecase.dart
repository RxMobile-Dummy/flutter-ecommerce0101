import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/account/data/datasource/account_services_datasource.dart';
import 'package:amazon_clone/features/account/domain/repository/account_services_repository.dart';
import 'package:amazon_clone/features/address/domain/repository/address_services_repository.dart';
import 'package:amazon_clone/features/admin/domain/entity/order_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../auth/domain/entity/user_entity.dart';

class FetchOrdersUseCase extends UseCase<List<OrderEntity>, Params10> {
  final AccountServicesRepository accountServicesRepository;

  FetchOrdersUseCase({required this.accountServicesRepository});

  @override
  Future<Either<Failure, List<OrderEntity>>?>? call(Params10 params) async =>
      await accountServicesRepository.fetchMyOrders(params.token!);
}

class Params10 extends Equatable {
  final String? token;

  const Params10({this.token});

  @override
  List<Object?> get props => [token];
}
