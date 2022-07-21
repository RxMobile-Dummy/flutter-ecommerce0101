import 'dart:io';

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/features/auth/auth_injection_container.dart'
    as auth;
import 'package:amazon_clone/features/admin/admin_injection_container.dart'
    as admin;
import 'package:amazon_clone/features/home/home_injection_container.dart'
    as home;
import 'package:amazon_clone/features/search/search_injection_container.dart'
    as search;
import 'package:amazon_clone/features/product_details/product_details_injection_container.dart'
    as product_details;
import 'package:amazon_clone/features/cart/cart_injection_container.dart'
    as cart;
import 'package:amazon_clone/features/address/address_injection_container.dart'
    as address;
import 'package:amazon_clone/features/account/account_injection_container.dart'
    as account;
import 'package:amazon_clone/injection_container.dart' as sl;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/presentation/cubit/user_detail_cubit.dart';

//this is for resolved handshake error, don't use in production
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();

  WidgetsFlutterBinding.ensureInitialized();
  await auth.init();
  await sl.init();
  await admin.init();
  await home.init();
  await search.init();
  await product_details.init();
  await cart.init();
  await address.init();
  await account.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserDetailCubit>(
      create: (context) => auth.auth<UserDetailCubit>()..getUserData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: GlobalVariables.amazon,
        theme: ThemeData(
          //set color for widgets like buttons, appbar
          colorScheme: const ColorScheme.light(
            primary: GlobalVariables.secondaryColor,
          ),
          //app bar theme
          appBarTheme: const AppBarTheme(
            elevation: 0,
            //all icon colors are black
            iconTheme: IconThemeData(color: Colors.black),
          ),
          //background for scaffold
          scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        ),
        onGenerateRoute: (settings) => generateRoute(settings),
        builder: (context, child) {
          return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: child);
        },
      ),
    );
  }
}
