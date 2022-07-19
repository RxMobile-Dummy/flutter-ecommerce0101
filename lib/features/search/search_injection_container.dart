import 'package:amazon_clone/features/search/presentation/cubit/search_services_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../injection_container.dart';
import 'data/datasource/search_services_datasource.dart';
import 'data/datasource/search_services_datasource_impl.dart';
import 'data/repository/search_services_repository_impl.dart';
import 'domain/repository/search_services_repository.dart';
import 'domain/usecase/fetch_search_products_usecase.dart.dart';

final search = GetIt.instance;

Future<void> init() async {
  // Cubit

  search.registerFactory(
    () => SearchServicesCubit(
      fetchSearchProductsUseCase: search(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(
      () => FetchSearchProductsUseCase(searchServicesRepository: search()));

  // Repository
  sl.registerLazySingleton<SearchServicesRepository>(
    () => SearchServicesRepositoryImpl(searchServicesDataSource: search()),
  );

  // Data sources
  sl.registerLazySingleton<SearchServicesDataSource>(
    () => SearchServicesDataSourceImpl(),
  );
}
