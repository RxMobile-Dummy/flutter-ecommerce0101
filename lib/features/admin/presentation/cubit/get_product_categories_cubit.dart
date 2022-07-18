import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/core/usecases/usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../domain/usecase/get_product_categories_usecase.dart';

class GetProductCategoriesCubit extends Cubit<BaseState> {
  final GetProductCategoriesUseCase getProductCategoriesUseCase;
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  late List<String> _list;
  GetProductCategoriesCubit({required this.getProductCategoriesUseCase})
      : super(StateInitial());


  getProductCategories() {
    getProductCategoriesUseCase.call(NoParams())!.then((value) =>
        value!.fold((l) => null, (r) {
          _list =r;
          emit(StateOnSuccess<List<String>>(r));
        }));
  }

  selectProductCategory() {
    emit(StateInitial());
    emit(StateOnSuccess<List<String>>(_list));
  }
  @override
  Future<void> close() {
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quantityController.dispose();
    return super.close();
  }
}
