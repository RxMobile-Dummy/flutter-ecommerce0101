import 'package:dartz/dartz.dart';

import '../../../../base/error/failures.dart';
import '../../../auth/data/model/user_model.dart';
import '../../../auth/domain/entity/user_entity.dart';
import '../../domain/repository/cart_services_repository.dart';
import '../datasource/cart_services_datasource.dart';

class CartServicesRepositoryImpl extends CartServicesRepository {
  final CartServicesDataSource cartServicesDataSource;

  CartServicesRepositoryImpl({required this.cartServicesDataSource});

  @override
  Future<Either<Failure, UserModel>> removeFromCart(
          String productId, UserEntity userEntity) async =>
      await cartServicesDataSource.removeFromCart(
          productId, userEntity as UserModel);
}
