import 'package:amazon_clone/features/address/presentation/cubit/address_services_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../injection_container.dart';
import 'data/datasource/address_services_datasource.dart';
import 'data/datasource/address_services_datasource_impl.dart';
import 'data/repository/address_services_repository_impl.dart';
import 'domain/repository/address_services_repository.dart';
import 'domain/usecase/delete_product_usecase.dart';
import 'domain/usecase/place_order_usecase.dart';
import 'domain/usecase/save_user_address_usecase.dart';

final address = GetIt.instance;

Future<void> init() async {
  // Cubit

  address.registerFactory(
    () => AddressServicesCubit(
        placeOrderUseCase: address(),
        deleteProductUseCase: address(),
        saveUserAddressUseCase: address()),
  );
  // Use cases
  sl.registerLazySingleton(
      () => PlaceOrderUseCase(addressServicesRepository: address()));
  sl.registerLazySingleton(
      () => DeleteProductUseCase(addressServicesRepository: address()));
  sl.registerLazySingleton(
      () => SaveUserAddressUseCase(addressServicesRepository: address()));
  // Repository
  sl.registerLazySingleton<AddressServicesRepository>(
    () => AddressServicesRepositoryImpl(addressServicesDataSource: address()),
  );

  // Data sources
  sl.registerLazySingleton<AddressServicesDataSource>(
    () => AddressServicesDataSourceImpl(),
  );
}
