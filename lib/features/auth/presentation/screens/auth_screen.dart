import 'package:amazon_clone/base/base_state.dart';
import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/features/auth/presentation/cubit/auth_manage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../common/widgets/custom_button.dart';
import '../../../../common/widgets/custom_textfield.dart';
import '../../data/datasource/auth_manage_datasource_impl.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController =TextEditingController();
  final TextEditingController _passwordController =TextEditingController();
  final TextEditingController _nameController =TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<AuthManageCubit, BaseState>(
            builder: (context, state) {
              if (state is StateOnSuccess) {
                return Column(
                  children: [
                    const Text(
                      GlobalVariables.welcome,
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                    ListTile(
                      tileColor: state
                      .response == Auth.signup ? GlobalVariables.backgroundColor : GlobalVariables.greyBackgroundColor,
                      title: const Text(
                        GlobalVariables.createAccount,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                        activeColor: GlobalVariables.secondaryColor,
                        value: Auth.signup,
                        onChanged: (dynamic value) {
                          BlocProvider.of<AuthManageCubit>(context)
                              .changeAuth(value as Auth);
                        },
                        groupValue: state.response,
                      ),
                    ),
                    if (state.response == Auth.signup)
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: GlobalVariables.backgroundColor,
                        child: Form(
                          key: _signUpFormKey,
                          child: Column(
                            children: [
                              CustomTextField(
                                textEditingController: _nameController,
                                hintText: GlobalVariables.name,
                              ),
                              const SizedBox(height: 10,),
                              CustomTextField(
                                textEditingController: _emailController,
                                hintText: GlobalVariables.email,
                              ),
                              const SizedBox(height: 10,),
                              CustomTextField(
                                textEditingController: _passwordController,
                                hintText: GlobalVariables.password,
                              ),
                              const SizedBox(height: 10,),
                              CustomButton(text: GlobalVariables.signUp , onTap: () {  },),
                            ],
                          ),
                        ),
                      ),
                    ListTile(
                      tileColor: state
                          .response == Auth.signin ? GlobalVariables.backgroundColor : GlobalVariables.greyBackgroundColor,
                      title: const Text(
                        GlobalVariables.signIn,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      leading: Radio(
                        activeColor: GlobalVariables.secondaryColor,
                        value: Auth.signin,
                        onChanged: (dynamic value) {
                          BlocProvider.of<AuthManageCubit>(context)
                              .changeAuth(value as Auth);
                        },
                        groupValue: state.response,
                      ),
                    ),
                    if (state.response == Auth.signin)
                      Container(
                        padding: const EdgeInsets.all(8),
                        color: GlobalVariables.backgroundColor,
                        child: Form(
                          key: _signInFormKey,
                          child: Column(
                            children: [
                              const SizedBox(height: 10,),
                              CustomTextField(
                                textEditingController: _emailController,
                                hintText: GlobalVariables.email,
                              ),
                              const SizedBox(height: 10,),
                              CustomTextField(
                                textEditingController: _passwordController,
                                hintText: GlobalVariables.password,
                              ),
                              const SizedBox(height: 10,),
                              CustomButton(text: GlobalVariables.signInButton , onTap: () {  },),
                            ],
                          ),
                        ),
                      ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
