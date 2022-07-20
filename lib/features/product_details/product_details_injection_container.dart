import 'package:amazon_clone/features/product_details/presentation/cubit/product_details_services_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../injection_container.dart';
import 'data/datasource/product_details_services_datasource.dart';
import 'data/datasource/product_details_services_datasource_impl.dart';
import 'data/repository/product_details_services_repository_impl.dart';
import 'domain/repository/product_repository_services_repository.dart';
import 'domain/usecase/add_to_cart_usecase.dart';
import 'domain/usecase/rate_product_usecase.dart';

final productDetails = GetIt.instance;

Future<void> init() async {
  // Cubit

  productDetails.registerFactory(
    () => ProductDetailsServicesCubit(
        rateToProductUseCase: productDetails(),
        addToCartUseCase: productDetails()),
  );
  // Use cases
  sl.registerLazySingleton(() =>
      RateToProductUseCase(productDetailsServicesRepository: productDetails()));
  sl.registerLazySingleton(() =>
      AddToCartUseCase(productDetailsServicesRepository: productDetails()));
  // Repository
  sl.registerLazySingleton<ProductDetailsServicesRepository>(
    () => ProductDetailsServicesRepositoryImpl(
        productDetailsServicesDataSource: productDetails()),
  );

  // Data sources
  sl.registerLazySingleton<ProductDetailsServicesDataSource>(
    () => ProductDetailsServicesDataSourceImpl(),
  );
}
