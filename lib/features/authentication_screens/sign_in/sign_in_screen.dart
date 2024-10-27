import 'package:e_commerce/core/resources/asstes_manager.dart';
import 'package:e_commerce/core/resources/color_manager.dart';
import 'package:e_commerce/core/resources/constants_manager.dart';
import 'package:e_commerce/core/resources/font_manager.dart';
import 'package:e_commerce/core/widget/main_text_field.dart';
import 'package:e_commerce/core/widget/validators.dart';

import 'package:e_commerce/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../sign_up/sign_up_screen.dart';

typedef Validator = String? Function(String?);

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isPassword=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text(
                  ConstantsManager.loginWelcomeWord,
                  style: GoogleFonts.poppins(
                      fontSize: FontSize.s24,
                      fontWeight: FontWeightManager.semiBold,
                      color: ColorManager.whiteColor),
                ),
                SizedBox(height: 5.h),
                Text(
                  ConstantsManager.signInWord,
                  style: GoogleFonts.poppins(
                      fontSize: FontSize.s16,
                      fontWeight: FontWeightManager.light,
                      color: ColorManager.whiteColor),
                ),
                SizedBox(height: 80.h),
                Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(ConstantsManager.emailAddress, style: GoogleFonts.poppins(
                        fontSize: FontSize.s18,
                        fontWeight: FontWeightManager.medium,
                        color: ColorManager.whiteColor),),
                    MainTextField(
                      hint: ConstantsManager.labelEmailAddress,
                      controller: emailController ,
                      myValidator: AppValidators.validateEmail,
                    ),
                    SizedBox(height: 40.h),
                    Text(ConstantsManager.password, style: GoogleFonts.poppins(
                        fontSize: FontSize.s18,
                        fontWeight: FontWeightManager.medium,
                        color: ColorManager.whiteColor),),
                    MainTextField(

                      secureText: isPassword,
                      keyboardType: TextInputType.number,
                      hint: ConstantsManager.labelPassword,
                      controller: passwordController,
                      myValidator: AppValidators.validatePassword,
                      suffixIcon: IconButton(onPressed: (){
                        isPassword=false;
                        setState(() {

                        });
                      }, icon: Icon(Icons.visibility_off)),
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        Text("forgot password?", style: GoogleFonts.poppins(
                            fontSize: FontSize.s18,
                            fontWeight: FontWeightManager.light,
                            color: ColorManager.whiteColor),),
                      ],
                    ),
                    SizedBox(height: 50.h),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        ),

                      ),
                        onPressed: () {
                          login();
                        },
                        child: Text("Login" , style: GoogleFonts.poppins(
                          color: ColorManager.primary,
                          fontWeight: FontWeightManager.medium,
                          fontSize: FontSize.s20
                        ),)),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("don't have an account?",style: GoogleFonts.poppins(
                            fontSize: FontSize.s14,
                            fontWeight: FontWeightManager.light,
                            color: ColorManager.whiteColor)),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                          },
                          child: Text("  Create account",style: GoogleFonts.poppins(
                              fontSize: FontSize.s14,
                              fontWeight: FontWeightManager.semiBold,
                              color: ColorManager.whiteColor)),
                        )
                      ],
                    )
                  ],
                )) ,





              ],
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
