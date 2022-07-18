import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';
import 'package:bloc/bloc.dart';

import '../../domain/usecase/get_user_data_usecase.dart';

class UserDetailCubit extends Cubit<BaseState> {
  final GetUserDataUseCase getUserDataUseCase;
  UserDetailCubit({required this.getUserDataUseCase}) : super(StateInitial());

  getUserData() {
    getUserDataUseCase.call(NoParams())!.then((value) => value!.fold(
        (l) => emit(StateErrorGeneral(l.message ?? '')),
        (r) => emit(Authenticated(r))));
  }
  setData(UserEntity userEntity){
    emit(Authenticated(userEntity));
  }
}
