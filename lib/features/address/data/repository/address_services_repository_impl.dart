import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/address/data/datasource/address_services_datasource.dart';
import 'package:amazon_clone/features/auth/data/model/user_model.dart';
import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';

import 'package:dartz/dartz.dart';

import '../../domain/repository/address_services_repository.dart';

class AddressServicesRepositoryImpl extends AddressServicesRepository {
  final AddressServicesDataSource addressServicesDataSource;

  AddressServicesRepositoryImpl({required this.addressServicesDataSource});

  @override
  Future<Either<Failure, String>> deleteProduct(
          String productId, String token) async =>
      await addressServicesDataSource.deleteProduct(productId, token);

  @override
  Future<Either<Failure, UserEntity>> placeOrder(
          String address, double totalSum, UserEntity userModel) async =>
      await addressServicesDataSource.placeOrder(
          address, totalSum, userModel as UserModel);

  @override
  Future<Either<Failure, UserEntity>> saveUserAddress(
          String address, UserEntity userModel) async =>
      await addressServicesDataSource.saveUserAddress(
          address, userModel as UserModel);
}
