import 'package:get_it/get_it.dart';

import 'auth/data/datasource/auth_manage_datasource.dart';
import 'auth/data/datasource/auth_manage_datasource_impl.dart';
import 'auth/data/repository/auth_manage_repository_impl.dart';
import 'auth/domain/repository/auth_manage_repository.dart';
import 'auth/domain/usecase/auth_manage_usecase.dart';
import 'auth/presentation/cubit/auth_manage_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(
    () => AuthManageCubit(authManageUseCase: sl()
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => AuthManageUseCase(authManageRepository: sl()));

  // Repository
  sl.registerLazySingleton<AuthManageRepository>(
    () => AuthManageRepositoryImpl(authManageDataSource: sl()),
  );
  // Data sources
  sl.registerLazySingleton<AuthManageDataSource>(
    () => AuthManageDataSourceImpl(),
  );
}
