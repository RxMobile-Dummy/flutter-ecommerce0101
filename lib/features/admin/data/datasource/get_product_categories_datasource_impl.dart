import 'package:amazon_clone/base/error/failures.dart';
import 'package:dartz/dartz.dart';

import '../../../../constants/global_variables.dart';
import 'get_product_categories_datasource.dart';

 class GetProductCategoriesDataSourceImpl extends GetProductCategoriesDataSource{
  @override
  Future<Either<Failure, List<String>>> getProductCategories() {
    List<String> productCategories = [
      GlobalVariables.mobiles,
      GlobalVariables.essentials,
      GlobalVariables.appliances,
      GlobalVariables.books,
      GlobalVariables.fashion
    ];
    return Future.value(Right(productCategories));
  }

}