import 'package:amazon_clone/features/admin/data/model/order_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../base/error/failures.dart';

abstract class AccountServicesDataSource {
  Future<Either<Failure, List<OrderModel>>> fetchMyOrders(String token);
}
