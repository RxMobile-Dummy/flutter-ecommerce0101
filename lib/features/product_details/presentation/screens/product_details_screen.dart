import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/features/admin/domain/entity/product_entity.dart';
import 'package:amazon_clone/features/auth/domain/entity/user_entity.dart';
import 'package:amazon_clone/routes_name.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../base/base_state.dart';
import '../../../../common/presentation/widgets/custom_button.dart';
import '../../../../common/presentation/widgets/stars.dart';
import '../../../../constants/global_variables.dart';
import '../../../auth/presentation/cubit/user_detail_cubit.dart';
import '../cubit/product_details_services_cubit.dart';

class ProductDetailScreen extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  void navigateToSearchScreen(String query, BuildContext context) {
    Navigator.pushNamed(context, RoutesName.searchScreen, arguments: query);
  }

  void addToCart(BuildContext context, ProductEntity productEntity) {
    BlocProvider.of<ProductDetailsServicesCubit>(context).addToCart(
        (context.read<UserDetailCubit>().state as Authenticated).userEntity,
        productEntity.id!);
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
      body: BlocListener<ProductDetailsServicesCubit, BaseState>(
        listener: (context, state) {
          if (state is StateOnAddCartSuccess) {
            BlocProvider.of<UserDetailCubit>(context)
                .setData(state.response as UserEntity);
          } else if (state is StateOnSuccess) {
            showSnackBar(context, state.response);
          } else if (state is StateErrorGeneral) {
            showSnackBar(context, state.errorMessage);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.id!,
                    ),
                    Stars(
                      rating:
                          context.read<ProductDetailsServicesCubit>().avgRating,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 10,
                ),
                child: Text(
                  product.name.toString(),
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              CarouselSlider(
                items: product.images!.map(
                  (i) {
                    return Builder(
                      builder: (BuildContext context) => Image.network(
                        i,
                        fit: BoxFit.contain,
                        height: 200,
                      ),
                    );
                  },
                ).toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 300,
                ),
              ),
              Container(
                color: Colors.black12,
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: RichText(
                  text: TextSpan(
                    text: GlobalVariables.dealPrice,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: '\$${product.price}',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(product.description.toString()),
              ),
              Container(
                color: Colors.black12,
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomButton(
                  text: GlobalVariables.buyNow,
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10),
                child: CustomButton(
                  text: GlobalVariables.addToCart,
                  onTap: () => addToCart(context, product),
                  color: const Color.fromRGBO(254, 216, 19, 1),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                color: Colors.black12,
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  GlobalVariables.rateTheProduct,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              RatingBar.builder(
                initialRating:
                    context.read<ProductDetailsServicesCubit>().myRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: GlobalVariables.secondaryColor,
                ),
                onRatingUpdate: (rating) {
                  BlocProvider.of<ProductDetailsServicesCubit>(context)
                      .rateToProduct(
                          (context.read<UserDetailCubit>().state
                                  as Authenticated)
                              .userEntity,
                          product.id!,
                          rating);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
