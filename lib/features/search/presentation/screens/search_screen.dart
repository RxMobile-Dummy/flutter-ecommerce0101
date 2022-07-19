import 'package:amazon_clone/features/search/presentation/cubit/search_services_cubit.dart';
import 'package:amazon_clone/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/base_state.dart';
import '../../../../common/presentation/widgets/loader.dart';
import '../../../../constants/global_variables.dart';
import '../../../home/presentation/widgets/address_box.dart';
import '../widget/searched_product.dart';

class SearchScreen extends StatelessWidget {
  final String searchQuery;
  const SearchScreen({
    Key? key,
    required this.searchQuery,
  }) : super(key: key);

  void navigateToSearchScreen(String query, context) {
    Navigator.pushNamed(context, RoutesName.searchScreen, arguments: query);
  }

  @override
  Widget build(BuildContext context) {
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
      body: BlocBuilder<SearchServicesCubit, BaseState>(
        builder: (context, state) {
          if (state is StateOnSuccess) {
            return Column(
              children: [
                const AddressBox(),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.response!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(
                          //   context,
                          //   ProductDetailScreen.routeName,
                          //   arguments: products![index],
                          // );
                        },
                        child: SearchedProduct(
                          product: state.response![index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is StateErrorGeneral) {
            return Center(
              child: Text(state.errorMessage.toString()),
            );
          }
          return const Loader();
        },
      ),
    );
  }
}
