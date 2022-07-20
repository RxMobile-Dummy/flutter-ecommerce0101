import 'package:amazon_clone/features/home/presentation/cubit/home_services_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../injection_container.dart';
import 'data/datasource/home_services_datasource.dart';
import 'data/datasource/home_services_datasource_impl.dart';
import 'data/repository/home_services_repository_impl.dart';
import 'domain/repository/home_services_repository.dart';
import 'domain/usecase/fetch_category_products_usecase.dart.dart';
import 'domain/usecase/fetch_deals_of_the_day_usecase.dart.dart';

final home = GetIt.instance;

Future<void> init() async {
  // Cubit

  home.registerFactory(
    () => HomeServicesCubit(
      fetchCategoryProductsUseCase: home(),
      fetchDealsOfTheDayUseCase: home(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(
      () => FetchCategoryProductsUseCase(homeServicesRepository: home()));
  sl.registerLazySingleton(
      () => FetchDealsOfTheDayUseCase(homeServicesRepository: home()));
  // Repository
  sl.registerLazySingleton<HomeServicesRepository>(
    () => HomeServicesRepositoryImpl(homeServicesDataSource: home()),
  );

  // Data sources
  sl.registerLazySingleton<HomeServicesDataSource>(
    () => HomeServicesDataSourceImpl(),
  );
}
