import 'package:amazon_clone/base/base_state.dart';
import 'package:bloc/bloc.dart';

import '../../domain/usecase/change_page_usecase.dart';

class BottomNavCubit extends Cubit<BaseState> {
  final ChangePageUseCase changePageUseCase;

  BottomNavCubit({required this.changePageUseCase}) : super(StateInitial());

  setPage(int page) {
    changePageUseCase.call(Params3(page: page))!.then((value) =>
        value!.fold((l) => null, (r) => emit(StateOnSuccess<int>(r))));
  }
}
