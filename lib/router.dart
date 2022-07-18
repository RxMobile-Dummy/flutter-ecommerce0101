import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/presentation/cubit/user_detail_cubit.dart';
import 'package:amazon_clone/features/auth/presentation/screens/auth_screen.dart';
import 'package:amazon_clone/features/home/screens/home_screen.dart';
import 'package:amazon_clone/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/data/datasource/auth_manage_datasource_impl.dart';
import 'features/auth/presentation/cubit/auth_manage_cubit.dart';
import 'features/auth/presentation/cubit/auth_service_cubit.dart';
import 'features/injection_container.dart' as sl;
import 'features/splash/presentation/splash_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RoutesName.splashScreen:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MultiBlocProvider(providers: [
          BlocProvider<UserDetailCubit>(
            create: (context) => sl.sl<UserDetailCubit>()..getUserData(),
          ),
        ], child: const SplashScreen()),
      );

    case RoutesName.authScreen:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MultiBlocProvider(providers: [
          BlocProvider<AuthServiceCubit>(
            create: (context) => sl.sl<AuthServiceCubit>(),
          ),
          BlocProvider<UserDetailCubit>(
            create: (context) => sl.sl<UserDetailCubit>(),
          ),
          BlocProvider<AuthManageCubit>(
            create: (context) => sl.sl<AuthManageCubit>()..changeAuth(Auth.signup),
          ),
        ], child: const AuthScreen()),
      );

    case RoutesName.homeScreen:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => MultiBlocProvider(providers: [
          BlocProvider<AuthServiceCubit>(
            create: (context) => sl.sl<AuthServiceCubit>(),
          ),
          BlocProvider<UserDetailCubit>(
            create: (context) => sl.sl<UserDetailCubit>(),
          ),
        ], child: const HomeScreen()),
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
