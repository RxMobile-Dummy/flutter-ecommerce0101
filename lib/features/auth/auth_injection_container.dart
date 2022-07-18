import 'package:amazon_clone/features/auth/presentation/cubit/auth_service_cubit.dart';
import 'package:get_it/get_it.dart';

import 'data/datasource/auth_manage_datasource.dart';
import 'data/datasource/auth_manage_datasource_impl.dart';
import 'data/datasource/auth_service_datasource.dart';
import 'data/datasource/auth_service_datasource_impl.dart';
import 'data/repository/auth_manage_repository_impl.dart';
import 'data/repository/auth_service_repository_impl.dart';
import 'domain/repository/auth_manage_repository.dart';
import 'domain/repository/auth_service_repository.dart';
import 'domain/usecase/auth_manage_usecase.dart';
import 'domain/usecase/get_user_data_usecase.dart';
import 'domain/usecase/sign_in_usecase.dart';
import 'domain/usecase/sign_up_usecase.dart';
import 'presentation/cubit/auth_manage_cubit.dart';
import 'presentation/cubit/user_detail_cubit.dart';

final auth = GetIt.instance;

Future<void> init() async {
  // Cubit
  auth.registerFactory(
    () => AuthManageCubit(authManageUseCase: auth()
    ),
  );
  auth.registerFactory(
        () => AuthServiceCubit(signUpUseCase: auth(), signInUseCase: auth()
    ),
  );
  auth.registerLazySingleton(
        () => UserDetailCubit(getUserDataUseCase: auth()
    ),
  );



  // Use cases
  auth.registerLazySingleton(() => AuthManageUseCase(authManageRepository: auth()));
  auth.registerLazySingleton(() => SignUpUseCase(authServiceRepository: auth()));
  auth.registerLazySingleton(() => SignInUseCase(authServiceRepository: auth()));
  auth.registerLazySingleton(() => GetUserDataUseCase(authServiceRepository: auth()));
  // Repository
  auth.registerLazySingleton<AuthManageRepository>(
    () => AuthManageRepositoryImpl(authManageDataSource: auth()),
  );
  auth.registerLazySingleton<AuthServiceRepository>(
        () => AuthServiceRepositoryImpl(authServiceDataSource: auth()),
  );
  // Data sources
  auth.registerLazySingleton<AuthManageDataSource>(
    () => AuthManageDataSourceImpl(),
  );
  auth.registerLazySingleton<AuthServiceDataSource>(
        () => AuthServiceDataSourceImpl(),
  );
}
