import 'package:amazon_clone/features/admin/domain/entity/order_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../base/error/failures.dart';

abstract class AccountServicesRepository {
  Future<Either<Failure, List<OrderEntity>>> fetchMyOrders(String token);
  Future<Either<Failure, String>> logOut();
}
