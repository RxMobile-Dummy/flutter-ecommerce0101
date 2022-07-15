import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/presentation/cubit/auth_manage_cubit.dart';
import 'package:amazon_clone/features/auth/presentation/screens/auth_screen.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/features/injection_container.dart' as sl;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/auth/data/datasource/auth_manage_datasource_impl.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await sl.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: BlocProvider<AuthManageCubit>(
        create: (context) => sl.sl<AuthManageCubit>()..changeAuth(Auth.signup),
        child: const AuthScreen(),
      ),
    );
  }
}
