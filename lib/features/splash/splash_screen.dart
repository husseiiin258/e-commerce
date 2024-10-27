import 'dart:async';

import 'package:e_commerce/features/authentication_screens/sign_in/sign_in_screen.dart';

import 'package:flutter/material.dart';

import '../../core/resources/asstes_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3 ), (){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=> SignInScreen()));
    });
    return Scaffold(

      body: Container(
        child: Image.asset(ImageAssets.splashScreen ,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,),
      ),
    );
  }
}
