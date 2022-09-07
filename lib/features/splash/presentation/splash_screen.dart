import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/base_state.dart';
import '../../../constants/global_variables.dart';
import '../../../routes_name.dart';
import '../../auth/presentation/cubit/user_detail_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocListener(
          listeners: [
            BlocListener<UserDetailCubit, BaseState>(
                listener: (context, state) {
              if (state is StateErrorGeneral) {
                debugPrint("StateErrorGeneral");
                debugPrint(state.errorMessage);
                Timer(const Duration(seconds: 3), () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    RoutesName.authScreen,
                    (route) => false,
                  );
                });
                //  showSnackBar(context, state.errorMessage);
              } else if (state is Authenticated) {
                if (state.userEntity.token!.isNotEmpty) {
                  if (state.userEntity.type == "user") {
                    Timer(const Duration(seconds: 3), () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesName.actualHome,
                        (route) => false,
                      );
                    });
                  } else {
                    Timer(const Duration(seconds: 3), () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesName.adminScreen,
                        (route) => false,
                      );
                    });
                  }
                } else {
                  Timer(const Duration(seconds: 3), () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      RoutesName.authScreen,
                      (route) => false,
                    );
                  });
                  debugPrint("token is ::${state.userEntity.token.toString()}");
                }
              } else {
                debugPrint("problem");
              }
            })
          ],
          child: Center(
            child: Image.asset(
              GlobalVariables.imageAmazon,
              width: 200,
              height: 60,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
