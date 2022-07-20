import 'package:amazon_clone/features/cart/presentation/cubit/cart_services_cubit.dart';
import 'package:amazon_clone/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/base_state.dart';
import '../../../../common/presentation/widgets/custom_button.dart';
import '../../../../constants/global_variables.dart';
import '../../../auth/presentation/cubit/user_detail_cubit.dart';
import '../../../home/presentation/widgets/address_box.dart';
import '../widgets/cart_product.dart';
import '../widgets/cart_subtotal.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  void navigateToSearchScreen(String query, BuildContext context) {
    Navigator.pushNamed(context, RoutesName.searchScreen, arguments: query);
  }

  void navigateToAddress(int sum, BuildContext context) {
    Navigator.pushNamed(
      context,
      RoutesName.addressScreen,
      arguments: sum.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<CartServicesCubit>(context).calculateSum(
        (context.read<UserDetailCubit>().state as Authenticated).userEntity);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 42,
                  margin: const EdgeInsets.only(left: 15),
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    elevation: 1,
                    child: TextFormField(
                      onFieldSubmitted: (query) =>
                          navigateToSearchScreen(query, context),
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          onTap: () {},
                          child: const Padding(
                            padding: EdgeInsets.only(
                              left: 6,
                            ),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                              size: 23,
                            ),
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(top: 10),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                          borderSide: BorderSide(
                            color: Colors.black38,
                            width: 1,
                          ),
                        ),
                        hintText: GlobalVariables.searchInAmazon,
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                color: Colors.transparent,
                height: 42,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: const Icon(Icons.mic, color: Colors.black, size: 25),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AddressBox(),
            const CartSubtotal(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<UserDetailCubit, BaseState>(
                builder: (context, state) {
                  return CustomButton(
                    text:
                        'Proceed to Buy (${(context.read<UserDetailCubit>().state as Authenticated).userEntity.cart!.length} items)',
                    onTap: () => navigateToAddress(
                        context.read<CartServicesCubit>().sum, context),
                    color: Colors.yellow[600],
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            Container(
              color: Colors.black12.withOpacity(0.08),
              height: 1,
            ),
            const SizedBox(height: 5),
            ListView.builder(
              itemCount:
                  (context.read<UserDetailCubit>().state as Authenticated)
                      .userEntity
                      .cart!
                      .length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CartProduct(
                  index: index,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
