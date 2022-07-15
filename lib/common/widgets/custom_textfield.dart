import 'package:amazon_clone/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  const CustomTextField({Key? key, required this.textEditingController, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariables.textFieldBorderSide,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariables.textFieldBorderSide,
          ),
        ),

      ),
      validator: (val){

      },
    );
  }
}
