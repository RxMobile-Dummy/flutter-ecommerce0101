import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:amazon_clone/features/home/presentation/cubit/home_services_cubit.dart';
import 'package:amazon_clone/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/presentation/widgets/loader.dart';
import '../../../../constants/global_variables.dart';

class DealOfDay extends StatelessWidget {
  const DealOfDay({Key? key}) : super(key: key);

  void navigateToDetailScreen(
      BuildContext context, ProductEntity productEntity) {
    Navigator.pushNamed(
      context,
      RoutesName.productDetails,
      arguments: productEntity,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeServicesCubit, BaseState>(
      builder: (context, state) {
        if (state is StateOnSuccess) {
          ProductEntity productEntity = state.response as ProductEntity;
          if (productEntity.name!.isEmpty) {
            return const SizedBox();
          } else {
            return GestureDetector(
              onTap: () => navigateToDetailScreen(context, state.response),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 10, top: 15),
                    child: const Text(
                      GlobalVariables.dealOfTheDay,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Image.network(
                    productEntity.images![0],
                    height: 235,
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 15),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      GlobalVariables.hundred,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
                    child: const Text(
                      GlobalVariables.vivek,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: productEntity.images!
                          .map(
                            (e) => Image.network(
                              e,
                              fit: BoxFit.fitWidth,
                              width: 100,
                              height: 100,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15,
                    ).copyWith(left: 15),
                    alignment: Alignment.topLeft,
                    child: Text(
                      GlobalVariables.seeAllDeals,
                      style: TextStyle(
                        color: Colors.cyan[800],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        } else if (state is StateErrorGeneral) {
          showSnackBar(context, state.errorMessage);
        }
        return const Loader();
      },
    );
  }
}
