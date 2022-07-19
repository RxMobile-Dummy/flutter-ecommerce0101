import 'package:amazon_clone/base/base_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../domain/usecase/sign_in_usecase.dart';
import '../../domain/usecase/sign_up_usecase.dart';

class AuthServiceCubit extends Cubit<BaseState> {
  final SignUpUseCase signUpUseCase;
  final SignInUseCase signInUseCase;

  AuthServiceCubit({required this.signInUseCase, required this.signUpUseCase})
      : super(StateInitial());

  signUp(String email, String name, String password) {
    emit(StateInitial());
    debugPrint("$email $name $password");
    signUpUseCase.call(Params1(email, name, password))!.then((value) => value!
        .fold((l) => emit(StateErrorGeneral(l.message ?? '')),
            (r) => emit(StateOnSuccess(r))));
  }

  signIn(String email, String password) {
    emit(StateInitial());
    debugPrint("$email $password");
    signInUseCase.call(Params2(email, password))!.then((value) => value!.fold(
        (l) => emit(StateErrorGeneral(l.message ?? '')),
        (r) => emit(Authenticated(r))));
  }
}
