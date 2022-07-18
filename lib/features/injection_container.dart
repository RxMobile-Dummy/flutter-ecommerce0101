import 'package:amazon_clone/features/auth/presentation/cubit/auth_service_cubit.dart';
import 'package:get_it/get_it.dart';

import 'auth/data/datasource/auth_manage_datasource.dart';
import 'auth/data/datasource/auth_manage_datasource_impl.dart';
import 'auth/data/datasource/auth_service_datasource.dart';
import 'auth/data/datasource/auth_service_datasource_impl.dart';
import 'auth/data/repository/auth_manage_repository_impl.dart';
import 'auth/data/repository/auth_service_repository_impl.dart';
import 'auth/domain/repository/auth_manage_repository.dart';
import 'auth/domain/repository/auth_service_repository.dart';
import 'auth/domain/usecase/auth_manage_usecase.dart';
import 'auth/domain/usecase/get_user_data_usecase.dart';
import 'auth/domain/usecase/sign_in_usecase.dart';
import 'auth/domain/usecase/sign_up_usecase.dart';
import 'auth/presentation/cubit/auth_manage_cubit.dart';
import 'auth/presentation/cubit/user_detail_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(
    () => AuthManageCubit(authManageUseCase: sl()
    ),
  );
  sl.registerFactory(
        () => AuthServiceCubit(signUpUseCase: sl(), signInUseCase: sl()
    ),
  );
  sl.registerLazySingleton(
        () => UserDetailCubit(getUserDataUseCase: sl()
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => AuthManageUseCase(authManageRepository: sl()));
  sl.registerLazySingleton(() => SignUpUseCase(authServiceRepository: sl()));
  sl.registerLazySingleton(() => SignInUseCase(authServiceRepository: sl()));
  sl.registerLazySingleton(() => GetUserDataUseCase(authServiceRepository: sl()));
  // Repository
  sl.registerLazySingleton<AuthManageRepository>(
    () => AuthManageRepositoryImpl(authManageDataSource: sl()),
  );
  sl.registerLazySingleton<AuthServiceRepository>(
        () => AuthServiceRepositoryImpl(authServiceDataSource: sl()),
  );
  // Data sources
  sl.registerLazySingleton<AuthManageDataSource>(
    () => AuthManageDataSourceImpl(),
  );
  sl.registerLazySingleton<AuthServiceDataSource>(
        () => AuthServiceDataSourceImpl(),
  );
}
