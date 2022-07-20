import 'package:amazon_clone/features/cart/presentation/cubit/cart_services_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../injection_container.dart';
import 'data/datasource/cart_services_datasource.dart';
import 'data/datasource/cart_services_datasource_impl.dart';
import 'data/repository/cart_services_repository_impl.dart';
import 'domain/repository/cart_services_repository.dart';
import 'domain/usecase/remove_from_cart_usecase.dart';

final cart = GetIt.instance;

Future<void> init() async {
  // Cubit

  cart.registerFactory(
    () => CartServicesCubit(
      removeFromCartUseCase: cart(),
    ),
  );
  // Use cases
  sl.registerLazySingleton(
      () => RemoveFromCartUseCase(cartServicesRepository: cart()));

  // Repository
  sl.registerLazySingleton<CartServicesRepository>(
    () => CartServicesRepositoryImpl(cartServicesDataSource: cart()),
  );

  // Data sources
  sl.registerLazySingleton<CartServicesDataSource>(
    () => CartServicesDataSourceImpl(),
  );
}
