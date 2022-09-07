import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/account/data/datasource/account_services_datasource.dart';
import 'package:amazon_clone/features/admin/data/model/order_model.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/account_services_repository.dart';

class AccountServicesRepositoryImpl extends AccountServicesRepository {
  final AccountServicesDataSource accountServicesDataSource;

  AccountServicesRepositoryImpl({required this.accountServicesDataSource});

  @override
  Future<Either<Failure, List<OrderModel>>> fetchMyOrders(String token) async =>
      await accountServicesDataSource.fetchMyOrders(token);

  @override
  Future<Either<Failure, String>> logOut() async =>
      await accountServicesDataSource.logOut();
}
