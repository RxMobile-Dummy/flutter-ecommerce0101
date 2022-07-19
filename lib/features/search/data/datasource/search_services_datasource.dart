import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/features/admin/data/model/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class SearchServicesDataSource {
  Future<Either<Failure, List<ProductModel>>> fetchSearchedProduct(
      String searchQuery, String token);
}
