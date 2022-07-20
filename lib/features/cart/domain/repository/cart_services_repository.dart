import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import '../../../../base/error/failures.dart';
import '../../../auth/data/model/user_model.dart';

abstract class CartServicesRepository {
  Future<Either<Failure, UserModel>> removeFromCart(
      String productId, UserEntity userEntity);
}
