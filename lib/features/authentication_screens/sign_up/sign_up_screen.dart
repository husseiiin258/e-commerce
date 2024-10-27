import 'package:e_commerce/core/widget/dialoug_utils.dart';
import 'package:e_commerce/di/di.dart';
import 'package:e_commerce/features/authentication_screens/sign_up/cubit/sign_up_states.dart';
import 'package:e_commerce/features/authentication_screens/sign_up/cubit/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/resources/asstes_manager.dart';
import '../../../core/resources/color_manager.dart';
import '../../../core/resources/constants_manager.dart';
import '../../../core/resources/font_manager.dart';
import '../../../core/widget/main_text_field.dart';
import '../../../core/widget/validators.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;

  RegisterScreenViewModel viewModel = getIt<RegisterScreenViewModel>();


  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterScreenViewModel, RegisterStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogUtils.showLoading(context, "Loading...");
        } else if (state is RegisterErrorState) {
          DialogUtils.hideDialog(context);
          DialogUtils.showMessage(context, state.failures.errorMsg,
              posActionName: "ok", title: "error");
        } else if (state is RegisterSuccessState) {
          DialogUtils.hideDialog(context);
          DialogUtils.showMessage(context, "Register Successfully",
              posActionName: "ok", title: "success");
        }
      },
      child: Scaffold(
        backgroundColor: ColorManager.primary,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  Center(child: Image.asset(ImageAssets.routeLogo)),
                  SizedBox(height: 40.h),
                  Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "full name",
                            style: GoogleFonts.poppins(
                                fontSize: FontSize.s18,
                                fontWeight: FontWeightManager.medium,
                                color: ColorManager.whiteColor),
                          ),
                          MainTextField(
                            hint: "enter your full name",
                            controller: viewModel.nameController,
                            myValidator: AppValidators.validateFullName,
                          ),
                          SizedBox(height: 25.h),
                          Text(
                            "mobile Number",
                            style: GoogleFonts.poppins(
                                fontSize: FontSize.s18,
                                fontWeight: FontWeightManager.medium,
                                color: ColorManager.whiteColor),
                          ),
                          MainTextField(
                            hint: "please enter your mobile no",
                            controller: viewModel.phoneController,
                            myValidator: AppValidators.validatePhoneNumber,
                          ),
                          SizedBox(height: 25.h),
                          Text(
                            ConstantsManager.emailAddress,
                            style: GoogleFonts.poppins(
                                fontSize: FontSize.s18,
                                fontWeight: FontWeightManager.medium,
                                color: ColorManager.whiteColor),
                          ),
                          MainTextField(
                            hint: ConstantsManager.labelEmailAddress,
                            controller: viewModel.emailController,
                            myValidator: AppValidators.validateEmail,
                          ),
                          SizedBox(height: 25.h),
                          Text(
                            ConstantsManager.password,
                            style: GoogleFonts.poppins(
                                fontSize: FontSize.s18,
                                fontWeight: FontWeightManager.medium,
                                color: ColorManager.whiteColor),
                          ),
                          MainTextField(
                            secureText: isPassword,
                            keyboardType: TextInputType.number,
                            hint: ConstantsManager.labelPassword,
                            controller: viewModel.passwordController,
                            myValidator: AppValidators.validatePassword,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  isPassword = false;
                                  setState(() {});
                                },
                                icon: Icon(Icons.visibility_off)),
                          ),
                          SizedBox(height: 25.h),
                          Text(
                            ConstantsManager.rePassword,
                            style: GoogleFonts.poppins(
                                fontSize: FontSize.s18,
                                fontWeight: FontWeightManager.medium,
                                color: ColorManager.whiteColor),
                          ),
                          MainTextField(
                            secureText: isPassword,
                            keyboardType: TextInputType.number,
                            hint: ConstantsManager.labelPassword,
                            controller: viewModel.rePasswordController,
                            myValidator: AppValidators.validatePassword,
                            suffixIcon: IconButton(
                                onPressed: () {
                                  isPassword = false;
                                  setState(() {});
                                },
                                icon: Icon(Icons.visibility_off)),
                          ),
                          SizedBox(height: 40.h),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                              onPressed: () {
                                login();
                              },
                              child: Text(
                                "Sign up",
                                style: GoogleFonts.poppins(
                                    color: ColorManager.primary,
                                    fontWeight: FontWeightManager.medium,
                                    fontSize: FontSize.s20),
                              )),
                        ],
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState?.validate() == true) {}
  }
}
