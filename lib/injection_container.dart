import 'package:get_it/get_it.dart';
import 'common/data/datasource/bottom_nav_datasource.dart';
import 'common/data/datasource/bottom_nav_datasource_impl.dart';
import 'common/data/repository/bottom_nav_repository_impl.dart';
import 'common/domain/repository/bottom_nav_repository.dart';
import 'common/domain/usecase/change_page_usecase.dart';
import 'common/presentation/cubit/bottom_nav_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Cubit
  sl.registerFactory(
    () => BottomNavCubit(changePageUseCase: sl()),
  );
  // Use cases
  sl.registerLazySingleton(() => ChangePageUseCase(bottomNavRepository: sl()));
  // Repository
  sl.registerLazySingleton<BottomNavRepository>(
    () => BottomNavRepositoryImpl(bottomNavDataSource: sl()),
  );
  // Data sources
  sl.registerLazySingleton<BottomNavDataSource>(
    () => BottomNavDataSourceImpl(),
  );
}
