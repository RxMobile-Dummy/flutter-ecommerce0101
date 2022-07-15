import 'package:bloc/bloc.dart';

import '../../../../base/base_state.dart';
import '../../data/datasource/auth_manage_datasource_impl.dart';
import '../../domain/usecase/auth_manage_usecase.dart';

class AuthManageCubit extends Cubit<BaseState> {
  final AuthManageUseCase authManageUseCase;

  AuthManageCubit({required this.authManageUseCase}) : super(StateInitial());

  changeAuth(Auth auth2) async {
    authManageUseCase.call(Params(auth: auth2))!.then(
        (value) => value!.fold((l) => null, (r) => emit(StateOnSuccess(r))));
  }
}
