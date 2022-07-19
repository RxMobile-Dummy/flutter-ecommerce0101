import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/fetch_category_products_usecase.dart.dart';

class HomeServicesCubit extends Cubit<BaseState> {
  final FetchCategoryProductsUseCase fetchCategoryProductsUseCase;

  late List<ProductEntity> _list;

  HomeServicesCubit({required this.fetchCategoryProductsUseCase})
      : super(StateInitial());

  fetchCategoryProducts(String token, String category) {
    fetchCategoryProductsUseCase
        .call(Params6(token: token, category: category))!
        .then((value) =>
            value!.fold((l) => emit(StateErrorGeneral(l.message ?? "")), (r) {
              _list = r;
              emit(StateOnSuccess<List<ProductEntity>>(_list));
            }));
  }
}
