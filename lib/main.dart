
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/router.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/features/auth/auth_injection_container.dart' as auth;
import 'package:amazon_clone/injection_container.dart' as sl;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await auth.init();
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
      builder: (context, child) {
        return GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: child);
      },
    );
  }
}
