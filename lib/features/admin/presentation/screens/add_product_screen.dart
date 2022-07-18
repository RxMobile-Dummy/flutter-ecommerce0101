import 'dart:io';

import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/admin/presentation/cubit/get_product_categories_cubit.dart';
import 'package:amazon_clone/features/admin/presentation/cubit/select_image_cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../common/presentation/widgets/custom_button.dart';
import '../../../../common/presentation/widgets/custom_textfield.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({Key? key}) : super(key: key);

//  final AdminServices adminServices = AdminServices();

  String category = GlobalVariables.mobiles;

  final _addProductFormKey = GlobalKey<FormState>();

  void sellProduct(List<String> images) {
    if (_addProductFormKey.currentState!.validate() && images.isNotEmpty) {
      // adminServices.sellProduct(
      //   context: context,
      //   name: productNameController.text,
      //   description: descriptionController.text,
      //   price: double.parse(priceController.text),
      //   quantity: double.parse(quantityController.text),
      //   category: category,
      //   images: images,
      // );
    }
  }

  void selectImages(BuildContext context) {
    BlocProvider.of<SelectImageCubit>(context).chooseImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: const Text(
            GlobalVariables.addProduct,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _addProductFormKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                BlocBuilder<SelectImageCubit, BaseState>(
                  builder: (context, state) {
                    if (state is StateOnSuccess) {
                      List<File> list = state.response as List<File>;
                      return CarouselSlider(
                        items: list.map(
                          (i) {
                            return Builder(
                              builder: (BuildContext context) => Image.file(
                                i,
                                fit: BoxFit.cover,
                                height: 200,
                              ),
                            );
                          },
                        ).toList(),
                        options: CarouselOptions(
                          viewportFraction: 1,
                          height: 200,
                        ),
                      );
                    }
                    return GestureDetector(
                      onTap: () => selectImages(context),
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        dashPattern: const [10, 4],
                        strokeCap: StrokeCap.round,
                        child: Container(
                          width: double.infinity,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.folder_open,
                                size: 40,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                GlobalVariables.selectProductImage,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey.shade400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  textEditingController: context
                      .read<GetProductCategoriesCubit>()
                      .productNameController,
                  hintText: GlobalVariables.productName,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  textEditingController: context
                      .read<GetProductCategoriesCubit>()
                      .descriptionController,
                  hintText: GlobalVariables.description,
                  maxLines: 7,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  textEditingController:
                      context.read<GetProductCategoriesCubit>().priceController,
                  hintText: GlobalVariables.price,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  textEditingController: context
                      .read<GetProductCategoriesCubit>()
                      .quantityController,
                  hintText: GlobalVariables.quantity,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: BlocBuilder<GetProductCategoriesCubit, BaseState>(
                    buildWhen: (previous, current) {
                      if (current is StateInitial) {
                        return false;
                      } else {
                        return true;
                      }
                    },
                    builder: (context, state) {
                      if (state is StateOnSuccess) {
                        List<String> list = state.response as List<String>;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DropdownButton(
                              value: category,
                              icon: const Icon(Icons.keyboard_arrow_down),
                              items: list.map((String item) {
                                return DropdownMenuItem(
                                  value: item,
                                  child: Text(item),
                                );
                              }).toList(),
                              onChanged: (String? newVal) {
                                category = newVal!;
                                BlocProvider.of<GetProductCategoriesCubit>(
                                        context)
                                    .selectProductCategory();
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomButton(
                              text: GlobalVariables.sell,
                              onTap: () => sellProduct(list),
                            ),
                          ],
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
