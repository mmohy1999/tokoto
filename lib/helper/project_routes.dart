import 'package:flutter/material.dart';
import 'package:tokoto_e_commerce/presentation/screens/cart/cart.dart';
import 'package:tokoto_e_commerce/presentation/screens/product_details/product_details.dart';
import '../presentation/screens/complete_profile/complete_profile.dart';
import '../presentation/screens/forget_password/forget_password.dart';
import '../presentation/screens/login_success/login_success.dart';
import '../presentation/screens/otp/otp.dart';
import '../presentation/screens/sign_in/sign_in.dart';
import '../presentation/screens/sing_up/sign_up.dart';
import '../presentation/screens/splash/splash.dart';

final Map<String, WidgetBuilder> projectRoutes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  SignInScreen.routeName: (context) => const SignInScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  ForgetPasswordScreen.routeName: (context) => const ForgetPasswordScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  LoginSuccessScreen.routeName: (context) => const LoginSuccessScreen(),
  DetailsScreen.routeName: (context) => const DetailsScreen(),
  CartScreen.routeName: (context) => const CartScreen(),

};
