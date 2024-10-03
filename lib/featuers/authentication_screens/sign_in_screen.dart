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

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,

      body: SafeArea(
       child: Padding(padding: EdgeInsets.all(30) ,
       child: SingleChildScrollView(

         child: Column(

           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 40.h),
             Center(child: Image.asset(ImageAssets.routeLogo)),
             SizedBox(height: 40.h),
             Text(ConstantsManager.loginWelcomeWord, style: GoogleFonts.poppins(
               fontSize: FontSize.s24,
               fontWeight: FontWeightManager.semiBold,
               color: ColorManager.whiteColor
             ),),
             SizedBox(height: 5.h),
             Text(ConstantsManager.signInWord , style: GoogleFonts.poppins(
                 fontSize: FontSize.s16,
                 fontWeight: FontWeightManager.light,
                 color: ColorManager.whiteColor
             ) ,),
             SizedBox(height: 40.h),


           ],
         ),
       ),),
      ),
    );
  }
}
