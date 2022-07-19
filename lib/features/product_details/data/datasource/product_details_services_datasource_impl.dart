

import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/product_details/data/datasource/product_details_services_datasource.dart';
import 'package:dartz/dartz.dart';

class ProductDetailsServicesDataSourceImpl
    extends ProductDetailsServicesDataSource {
  @override
  Future<Either<Failure, String>> addToCart(String productId) {
    // TODO: implement addToCart
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> rateProduct(String productId, double rating) {
    // TODO: implement rateProduct
    throw UnimplementedError();
  }
}
