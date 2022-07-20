import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:amazon_clone/features/home/domain/usecase/fetch_deals_of_the_day_usecase.dart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../admin/domain/usecase/fetch_all_products_usecase.dart';
import '../../domain/usecase/fetch_category_products_usecase.dart.dart';

class HomeServicesCubit extends Cubit<BaseState> {
  final FetchCategoryProductsUseCase fetchCategoryProductsUseCase;
  final FetchDealsOfTheDayUseCase fetchDealsOfTheDayUseCase;

  late List<ProductEntity> _list;

  HomeServicesCubit(
      {required this.fetchDealsOfTheDayUseCase,
      required this.fetchCategoryProductsUseCase})
      : super(StateInitial());

  fetchCategoryProducts(String token, String category) {
    emit(StateInitial());
    fetchCategoryProductsUseCase
        .call(Params6(token: token, category: category))!
        .then((value) =>
            value!.fold((l) => emit(StateErrorGeneral(l.message ?? "")), (r) {
              _list = r;
              emit(StateOnSuccess<List<ProductEntity>>(_list));
            }));
  }

  fetchDealsOfTheDay(String token) {
    emit(StateInitial());
    fetchDealsOfTheDayUseCase.call(Params5(token: token))!.then((value) =>
        value!.fold((l) => emit(StateErrorGeneral(l.message ?? "")),
            (r) => emit(StateOnSuccess<ProductEntity>(r))));
  }
}
