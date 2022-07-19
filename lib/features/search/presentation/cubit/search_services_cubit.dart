import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecase/fetch_search_products_usecase.dart.dart';

class SearchServicesCubit extends Cubit<BaseState> {
  final FetchSearchProductsUseCase fetchSearchProductsUseCase;

  late List<ProductEntity> _list;

  SearchServicesCubit({required this.fetchSearchProductsUseCase})
      : super(StateInitial());

  fetchCategoryProducts(String token, String searchQuery) {
    fetchSearchProductsUseCase
        .call(Params7(token: token, searchQuery: searchQuery))!
        .then((value) =>
            value!.fold((l) => emit(StateErrorGeneral(l.message ?? "")), (r) {
              _list = r;
              emit(StateOnSuccess<List<ProductEntity>>(_list));
            }));
  }
}
