import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/admin/data/model/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeServicesDataSource {
  Future<Either<Failure, List<ProductModel>>> fetchCategoryProducts(
      String category, String token);
  Future<Either<Failure, ProductModel>> fetchDealOfDay(String token);
}
