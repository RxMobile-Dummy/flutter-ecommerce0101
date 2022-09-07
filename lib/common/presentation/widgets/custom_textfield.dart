import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/presentation/cubit/auth_manage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final int? maxLines;
  final bool isObscure;

  const CustomTextField({Key? key,
    required this.textEditingController,
    required this.hintText,
    this.maxLines, this.isObscure = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hintText == GlobalVariables.password && isObscure ? true : false,
      enableSuggestions: hintText == GlobalVariables.password ? false : true,
      autocorrect: hintText == GlobalVariables.password ? false : true,
      controller: textEditingController,
      decoration: InputDecoration(
        suffixIcon: hintText == GlobalVariables.password ? IconButton(
            icon: Icon(
                isObscure ? Icons.visibility : Icons.visibility_off),
            onPressed: () =>
                BlocProvider.of<AuthManageCubit>(context).isObscure()
        ) : null,
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariables.textFieldBorderSide,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: GlobalVariables.textFieldBorderSide,
          ),
        ),
      ),
      maxLines: maxLines ?? 1,
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your $hintText';
        }
        return null;
      },
    );
  }
}
