import 'package:amazon_clone/base/error/failures.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:amazon_clone/features/admin/domain/repository/get_product_categories_repository.dart';
import 'package:dartz/dartz.dart';

class GetProductCategoriesUseCase extends UseCase<List<String>, NoParams> {
  final GetProductCategoriesRepository getProductCategoriesRepository;

  GetProductCategoriesUseCase({required this.getProductCategoriesRepository});

  @override
  Future<Either<Failure, List<String>>?>? call(params) async =>
      await getProductCategoriesRepository.getProductCategories();
}
