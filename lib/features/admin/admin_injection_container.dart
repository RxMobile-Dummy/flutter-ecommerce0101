import 'package:amazon_clone/features/admin/presentation/cubit/get_product_categories_cubit.dart';
import 'package:amazon_clone/features/admin/presentation/cubit/select_image_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../injection_container.dart';
import 'data/datasource/get_product_categories_datasource.dart';
import 'data/datasource/get_product_categories_datasource_impl.dart';
import 'data/repository/get_product_categories_repository_impl.dart';
import 'domain/repository/get_product_categories_repository.dart';
import 'domain/usecase/get_product_categories_usecase.dart';

final admin = GetIt.instance;

Future<void> init() async {
  // Cubit
  admin.registerFactory(
    () => SelectImageCubit(),
  );
  admin.registerFactory(
    () => GetProductCategoriesCubit(getProductCategoriesUseCase: admin()),
  );
  // Use cases
  sl.registerLazySingleton(() =>
      GetProductCategoriesUseCase(getProductCategoriesRepository: admin()));
  // Repository
  sl.registerLazySingleton<GetProductCategoriesRepository>(
    () => GetProductCategoriesRepositoryImpl(
        getProductCategoriesDataSource: admin()),
  );
  // Data sources
  sl.registerLazySingleton<GetProductCategoriesDataSource>(
    () => GetProductCategoriesDataSourceImpl(),
  );
}
