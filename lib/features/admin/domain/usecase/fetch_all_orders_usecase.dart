import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:amazon_clone/features/admin/domain/entity/order_entity.dart';
import 'package:amazon_clone/features/admin/domain/repository/admin_services_repository.dart';
import 'package:dartz/dartz.dart';
import 'fetch_all_products_usecase.dart';

class FetchAllOrdersUseCase extends UseCase<List<OrderEntity>, Params5> {
  final AdminServicesRepository adminServicesRepository;

  FetchAllOrdersUseCase({required this.adminServicesRepository});

  @override
  Future<Either<Failure, List<OrderEntity>>?>? call(params) async =>
      await adminServicesRepository.fetchAllOrders(params.token);
}

