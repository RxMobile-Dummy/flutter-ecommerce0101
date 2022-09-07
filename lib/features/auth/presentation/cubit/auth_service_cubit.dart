import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/features/auth/domain/entity/auth_manage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecase/sign_in_usecase.dart';
import '../../domain/usecase/sign_up_usecase.dart';

class AuthServiceCubit extends Cubit<BaseState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;

  AuthServiceCubit({required this.signInUseCase, required this.signUpUseCase})
      : super(StateInitial());

  signUp(UserType userType,String email, String name, String password) {
    emit(StateInitial());
    String type ='user';
    if(userType == UserType.admin){
      type ='admin';
    }
    debugPrint("$email $name $password $type");
    signUpUseCase.call(Params1(email, name, password,type))!.then((value) => value!
        .fold((l) => emit(StateErrorGeneral(l.message ?? '')),
            (r) => emit(StateOnSuccess(r))));
  }

  signIn(UserType userType,String email, String password) {
    emit(StateInitial());
    String type ='user';
    if(userType == UserType.admin){
      type ='admin';
    }
    debugPrint("$email $password $type");
    signInUseCase.call(Params2(email, password,type))!.then((value) => value!.fold(
        (l) => emit(StateErrorGeneral(l.message ?? '')),
        (r) => emit(Authenticated(r))));
  }
}
