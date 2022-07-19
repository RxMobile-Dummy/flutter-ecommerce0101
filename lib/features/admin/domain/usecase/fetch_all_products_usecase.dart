import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:amazon_clone/features/admin/domain/repository/admin_services_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class FetchAllProducts extends UseCase<List<ProductEntity>, Params5> {
  final AdminServicesRepository adminServicesRepository;

  FetchAllProducts({required this.adminServicesRepository});

  @override
  Future<Either<Failure, List<ProductEntity>>?>? call(params) async =>
      await adminServicesRepository.fetchAllProducts(params.token);
}

class Params5 extends Equatable {
  final String token;

  const Params5({required this.token});

  @override
  List<Object?> get props => [token];
}
