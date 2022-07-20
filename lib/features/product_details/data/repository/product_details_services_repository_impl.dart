import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/auth/data/model/user_model.dart';
import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/product_details_services_repository.dart';
import '../datasource/product_details_services_datasource.dart';

class ProductDetailsServicesRepositoryImpl
    extends ProductDetailsServicesRepository {
  final ProductDetailsServicesDataSource productDetailsServicesDataSource;

  ProductDetailsServicesRepositoryImpl(
      {required this.productDetailsServicesDataSource});

  @override
  Future<Either<Failure, UserModel>> addToCart(
      String productId, UserEntity userEntity) async {
    return await productDetailsServicesDataSource.addToCart(
        productId, userEntity as UserModel);
  }

  @override
  Future<Either<Failure, String>> rateProduct(
      String productId, double rating, String token) async {
    return await productDetailsServicesDataSource.rateProduct(
        productId, rating, token);
  }
}
