import 'dart:io';

import 'package:amazon_clone/base/base_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constants/utils.dart';

class SelectImageCubit extends Cubit<BaseState> {
  SelectImageCubit() : super(StateInitial());
  late List<File> list;
  chooseImage() async {
    var res = await pickImages();
    list = res;
    if (res.isNotEmpty) {
      emit(StateOnSuccess<List<File>>(list));
    }
  }
}
