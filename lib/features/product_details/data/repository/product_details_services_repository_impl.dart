import 'package:amazon_clone/base/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../domain/repository/product_repository_services_repository.dart';
import '../datasource/product_details_services_datasource.dart';

class ProductDetailsServicesRepositoryImpl
    extends ProductDetailsServicesRepository {
  final ProductDetailsServicesDataSource productDetailsServicesDataSource;

  ProductDetailsServicesRepositoryImpl(
      {required this.productDetailsServicesDataSource});

  @override
  Future<Either<Failure, String>> addToCart(String productId) async {
    return await productDetailsServicesDataSource.addToCart(productId);
  }

  @override
  Future<Either<Failure, String>> rateProduct(
      String productId, double rating) async {
    return await productDetailsServicesDataSource.rateProduct(
        productId, rating);
  }
}
