import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/base_state.dart';
import '../../../constants/utils.dart';
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
                        showSnackBar(context, state.errorMessage);
                      } else if (state is Authenticated) {
                        if(state.userEntity.token!.isNotEmpty){
                          Timer(const Duration(seconds: 3), () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              RoutesName.actualHome,
                                  (route) => false,
                            );
                          });

                        }else{
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
              child: const Center(
              child:Text("HI"))
                  // child: Image.asset(
                  //   "",
                  //   height: 150.0,
                  //   width: 114.42,
                  // )),
            )));
  }
}
