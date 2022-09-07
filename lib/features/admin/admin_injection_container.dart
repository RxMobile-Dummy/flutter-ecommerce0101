import 'package:amazon_clone/features/admin/presentation/cubit/admin_services_cubit.dart';
import 'package:amazon_clone/features/admin/presentation/cubit/get_product_categories_cubit.dart';
import 'package:amazon_clone/features/admin/presentation/cubit/select_image_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../injection_container.dart';
import 'data/datasource/admin_services_datasource.dart';
import 'data/datasource/admin_services_datasource_impl.dart';
import 'data/datasource/get_product_categories_datasource.dart';
import 'data/datasource/get_product_categories_datasource_impl.dart';
import 'data/repository/admin_services_repository_impl.dart';
import 'data/repository/get_product_categories_repository_impl.dart';
import 'domain/repository/admin_services_repository.dart';
import 'domain/repository/get_product_categories_repository.dart';
import 'domain/usecase/change_order_status_usecase.dart';
import 'domain/usecase/delete_product_usecase.dart';
import 'domain/usecase/fetch_all_orders_usecase.dart';
import 'domain/usecase/fetch_all_products_usecase.dart';
import 'domain/usecase/get_earnings_usecase.dart';
import 'domain/usecase/get_product_categories_usecase.dart';
import 'domain/usecase/sell_product_usecase.dart';

final admin = GetIt.instance;

Future<void> init() async {
  // Cubit
  admin.registerFactory(
    () => SelectImageCubit(),
  );
  admin.registerFactory(
    () => GetProductCategoriesCubit(getProductCategoriesUseCase: admin()),
  );
  admin.registerFactory(
    () => AdminServicesCubit(
        sellProductUseCase: admin(),
        fetchAllProducts: admin(),
        deleteProductUseCase: admin(),
        fetchAllOrdersUseCase: admin(),
        changeOrderStatusUseCase: admin(),
        getEarningsUseCase: admin()),
  );
  // Use cases
  sl.registerLazySingleton(() =>
      GetProductCategoriesUseCase(getProductCategoriesRepository: admin()));
  sl.registerLazySingleton(
      () => SellProductUseCase(adminServicesRepository: admin()));
  sl.registerLazySingleton(
      () => FetchAllProducts(adminServicesRepository: admin()));
  sl.registerLazySingleton(
      () => DeleteProductUseCase(adminServicesRepository: admin()));
  sl.registerLazySingleton(
      () => FetchAllOrdersUseCase(adminServicesRepository: admin()));
  sl.registerLazySingleton(
      () => ChangeOrderStatusUseCase(adminServicesRepository: admin()));
  sl.registerLazySingleton(
      () => GetEarningsUseCase(adminServicesRepository: admin()));
  // Repository
  sl.registerLazySingleton<GetProductCategoriesRepository>(
    () => GetProductCategoriesRepositoryImpl(
        getProductCategoriesDataSource: admin()),
  );
  sl.registerLazySingleton<AdminServicesRepository>(
    () => AdminServicesRepositoryImpl(adminServicesDataSource: admin()),
  );
  // Data sources
  sl.registerLazySingleton<GetProductCategoriesDataSource>(
    () => GetProductCategoriesDataSourceImpl(),
  );
  sl.registerLazySingleton<AdminServicesDataSource>(
    () => AdminServicesDataSourceImpl(),
  );
}
