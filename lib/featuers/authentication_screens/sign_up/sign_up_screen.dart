import 'package:flutter/material.dart';
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
  TextEditingController emailController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
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

                Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("full name", style: GoogleFonts.poppins(
                            fontSize: FontSize.s18,
                            fontWeight: FontWeightManager.medium,
                            color: ColorManager.whiteColor),),
                        MainTextField(
                          hint:"enter your full name",
                          controller: fullNameController ,
                          myValidator: AppValidators.validateFullName,
                        ),
                        SizedBox(height: 25.h),
                        Text("mobile Number", style: GoogleFonts.poppins(
                            fontSize: FontSize.s18,
                            fontWeight: FontWeightManager.medium,
                            color: ColorManager.whiteColor),),
                        MainTextField(
                          hint: "please enter your mobile no",
                          controller: phoneNumberController ,
                          myValidator: AppValidators.validatePhoneNumber,
                        ),
                        SizedBox(height: 25.h),
                        Text(ConstantsManager.emailAddress, style: GoogleFonts.poppins(
                            fontSize: FontSize.s18,
                            fontWeight: FontWeightManager.medium,
                            color: ColorManager.whiteColor),),
                        MainTextField(
                          hint: ConstantsManager.labelEmailAddress,
                          controller: emailController ,
                          myValidator: AppValidators.validateEmail,
                        ),
                        SizedBox(height: 25.h),
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

                        SizedBox(height: 40.h),
                        ElevatedButton(

                            style: ElevatedButton.styleFrom(

                              padding: EdgeInsets.symmetric(vertical: 10),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)
                              ),

                            ),
                            onPressed: () {
                              login();
                            },
                            child: Text("Sign up" , style: GoogleFonts.poppins(
                                color: ColorManager.primary,
                                fontWeight: FontWeightManager.medium,
                                fontSize: FontSize.s20
                            ),)),

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
