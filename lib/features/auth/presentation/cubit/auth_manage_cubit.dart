import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/base_state.dart';
import '../../domain/entity/auth_manage.dart';

class AuthManageCubit extends Cubit<BaseState> {
  AuthManageCubit() : super(StateInitial());
  Auth _auth = Auth.signup;
  UserType _userType = UserType.user;
  bool _isObscure = false;
  changeAuth(Auth auth2) async {
    _auth = auth2;
    emit(StateOnSuccess<AuthManage>(AuthManage(auth: _auth, userType: _userType)));
  }
  isObscure(){
    _isObscure =!_isObscure;
    emit(StateOnSuccess<AuthManage>(AuthManage(auth: _auth, userType: _userType,isObscure: _isObscure)));
  }
  changeUserType(UserType userType2) {
    _userType = userType2;
    emit(StateOnSuccess<AuthManage>(AuthManage(auth: _auth, userType: _userType)));
  }
}
