import 'package:e_commerce/core/routes_manager/routes.dart';
import 'package:e_commerce/featuers/authentication_screens/sign_in/sign_in_screen.dart';
import 'package:e_commerce/featuers/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic>  getRoute(RouteSettings settings){
    switch(settings.name){
      case Routes.cartRoute:
        return MaterialPageRoute(builder: (_) => SignInScreen());



      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => SignInScreen());


      case Routes.productDetails:
        return MaterialPageRoute(builder: (_) => SignInScreen());


      case Routes.productsScreenRoute:
        return MaterialPageRoute(builder: (_) => SignInScreen());


      case Routes.signInRoute:
        return MaterialPageRoute(builder: (_) => SignInScreen());


      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => SignInScreen());


      case Routes.splashScreenRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());


      case Routes.wishRoute:
        return MaterialPageRoute(builder: (_) => SignInScreen());

      default:
        return unDefinedRoute() ;

    }
  }

  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_) => Scaffold(
      appBar:AppBar(
        title: Text("UN DEFINED ROUTE"),
      ) ,
    ));
  }
}