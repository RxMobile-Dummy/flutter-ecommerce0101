import 'package:amazon_clone/features/account/presentation/cubit/account_services_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../injection_container.dart';
import 'data/datasource/account_services_datasource.dart';
import 'data/datasource/account_services_datasource_impl.dart';
import 'data/repository/account_services_repository_impl.dart';
import 'domain/repository/account_services_repository.dart';
import 'domain/usecase/fetch_orders_usecase.dart';
import 'domain/usecase/logout_usecase.dart';

final account = GetIt.instance;

Future<void> init() async {
  // Cubit

  account.registerFactory(
      () => AccountServicesCubit(fetchOrdersUseCase: account(), logoutUseCase: account()));
  // Use cases
  sl.registerLazySingleton(
      () => FetchOrdersUseCase(accountServicesRepository: account()));
  sl.registerLazySingleton(
          () => LogoutUseCase(accountServicesRepository: account()));
  // Repository
  sl.registerLazySingleton<AccountServicesRepository>(
    () => AccountServicesRepositoryImpl(accountServicesDataSource: account()),
  );

  // Data sources
  sl.registerLazySingleton<AccountServicesDataSource>(
    () => AccountServicesDataSourceImpl(),
  );
}
