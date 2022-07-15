import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/presentation/screens/auth_screen.dart';
import 'package:amazon_clone/routes_name.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case RoutesName.authScreen:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
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
