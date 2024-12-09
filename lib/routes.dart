import 'package:shopay_flutter_eccommerce/components/custom_navigation_bar.dart';
import 'package:shopay_flutter_eccommerce/model/products.dart';
import 'package:shopay_flutter_eccommerce/screens/cart/cart_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/details/detail_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/favourite/favourite_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/home/home_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/login_success/login_success_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/otp/otp_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/profile/profile_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/sign_in/sign_in_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/sign_up/sign_up_screen.dart';
import 'package:shopay_flutter_eccommerce/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(), 
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  DetailScreen.routeName: (context) {
    final product = ModalRoute.of(context)!.settings.arguments as Product;
    return DetailScreen(product: product);
  },
  CartScreen.routeName : (context) => const CartScreen(),
  FavouriteScreen.routeName : (context) => const FavouriteScreen(),
  ProfileScreen.routeName : (context)=> const ProfileScreen(),
  CustomNavigationBar.routeName : (context) => const CustomNavigationBar(),
};