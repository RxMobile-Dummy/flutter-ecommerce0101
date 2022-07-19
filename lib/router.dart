import 'package:amazon_clone/common/presentation/cubit/bottom_nav_cubit.dart';
import 'package:amazon_clone/common/presentation/widgets/bottom_bar.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/presentation/screens/add_product_screen.dart';
import 'package:amazon_clone/features/admin/presentation/screens/admin_screen.dart';
import 'package:amazon_clone/features/auth/presentation/cubit/user_detail_cubit.dart';
import 'package:amazon_clone/features/home/presentation/cubit/home_services_cubit.dart';
import 'package:amazon_clone/features/search/presentation/cubit/search_services_cubit.dart';

import 'package:amazon_clone/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base/base_state.dart';
import 'features/admin/presentation/cubit/admin_services_cubit.dart';
import 'features/admin/presentation/cubit/get_product_categories_cubit.dart';
import 'features/admin/presentation/cubit/select_image_cubit.dart';
import 'features/auth/data/datasource/auth_manage_datasource_impl.dart';
import 'features/auth/presentation/cubit/auth_manage_cubit.dart';
import 'features/auth/presentation/cubit/auth_service_cubit.dart';
import 'features/auth/auth_injection_container.dart' as auth;
import 'features/admin/admin_injection_container.dart' as admin;
import 'features/home/home_injection_container.dart' as home;
import 'features/search/search_injection_container.dart' as search;
import '/injection_container.dart' as sl;
import 'features/auth/presentation/screens/auth_screen.dart';
import 'features/home/presentation/screens/category_deals_screen.dart';
import 'features/home/presentation/screens/home_screen.dart';
import 'features/search/presentation/screens/search_screen.dart';
import 'features/splash/presentation/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RoutesName.splashScreen:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) =>  Builder(
          builder: (context) {
            return const SplashScreen();
          }
        ),
      );

    case RoutesName.authScreen:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MultiBlocProvider(providers: [
          BlocProvider<AuthServiceCubit>(
            create: (context) => auth.auth<AuthServiceCubit>(),
          ),
          BlocProvider<AuthManageCubit>(
            create: (context) =>
                auth.auth<AuthManageCubit>()..changeAuth(Auth.signup),
          ),
        ], child: const AuthScreen()),
      );

    case RoutesName.actualHome:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MultiBlocProvider(providers: [
          BlocProvider<AuthServiceCubit>(
            create: (context) => auth.auth<AuthServiceCubit>(),
          ),
          BlocProvider<BottomNavCubit>(
            create: (context) => sl.sl<BottomNavCubit>()..setPage(0),
          ),

        ], child: BottomBar()),
      );

    case RoutesName.adminScreen:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MultiBlocProvider(providers: [
          BlocProvider<BottomNavCubit>(
            create: (context) => sl.sl<BottomNavCubit>()..setPage(0),
          ),
          BlocProvider<AdminServicesCubit>(
                  create: (context) => admin.admin<AdminServicesCubit>()/*..fetchAllProduct((context.read<UserDetailCubit>().state as Authenticated)
                      .userEntity
                      .token
                      .toString()),*/
                ),
        ], child: AdminScreen()),
      );

    case RoutesName.homeScreen:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MultiBlocProvider(providers: [
          BlocProvider<AuthServiceCubit>(
            create: (context) => auth.auth<AuthServiceCubit>(),
          ),

        ], child: const HomeScreen()),
      );

    case RoutesName.addProduct:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MultiBlocProvider(providers: [

          BlocProvider<AdminServicesCubit>(
            create: (context) => admin.admin<AdminServicesCubit>(),
          ),
          BlocProvider<SelectImageCubit>(
            create: (context) => admin.admin<SelectImageCubit>(),
          ),
          BlocProvider<GetProductCategoriesCubit>(
            create: (context) => admin.admin<GetProductCategoriesCubit>()
              ..getProductCategories(),
          ),
        ], child: AddProductScreen()),
      );

    case RoutesName.categoryDealsScreen:
      var category = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MultiBlocProvider(providers: [
          BlocProvider<HomeServicesCubit>(
            create: (context) => home.home<HomeServicesCubit>()..fetchCategoryProducts((context.read<UserDetailCubit>().state as Authenticated)
                .userEntity
                .token
                .toString(),category),
          ),
        ], child:  CategoryDealsScreen( category: category,)),
      );
    case RoutesName.searchScreen:
      var searchQuery = routeSettings.arguments as String;
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MultiBlocProvider(providers: [
          BlocProvider<SearchServicesCubit>(
            create: (context) => search.search<SearchServicesCubit>()..fetchCategoryProducts((context.read<UserDetailCubit>().state as Authenticated)
                .userEntity
                .token
                .toString(),searchQuery),
          ),
        ], child:  SearchScreen(
          searchQuery: searchQuery,
        ),),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(child: Text(GlobalVariables.noRoutesFound)),
        ),
      );
  }
}
