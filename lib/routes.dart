import 'package:flutter/widgets.dart';
import 'package:magento_mobile/screens/cart/cart_screen.dart';
import 'package:magento_mobile/screens/complete_profile/complete_profile_screen.dart';
import 'package:magento_mobile/screens/details/details_screen.dart';
import 'package:magento_mobile/screens/forgot_password/forgot_password_screen.dart';
import 'package:magento_mobile/screens/home/home_screen.dart';
import 'package:magento_mobile/screens/login_success/login_success_screen.dart';
import 'package:magento_mobile/screens/otp/otp_screen.dart';
import 'package:magento_mobile/screens/profile/profile_screen.dart';
import 'package:magento_mobile/screens/show_more/show_more.dart';
import 'package:magento_mobile/screens/sign_in/sign_in_screen.dart';
import 'package:magento_mobile/screens/splash/splash_screen.dart';

import 'screens/sign_up/sign_up_screen.dart';

// We use name route
// All our routes will be available here
/* TODO:create onRouteGenate in close source https://resocoder.com/2019/04/27/flutter-routes-navigation-parameters-named-routes-ongenerateroute/
  final Map<String, WidgetBuilder> routes = {
  static Route<dynamic> genrateRoutes(RouteSettings settings){
    final args = settings.arguments; */

    
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignInScreen.routeName: (context) => SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  LoginSuccessScreen.routeName: (context) => LoginSuccessScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  ShowMore.routeName:(context)=>ShowMore(),
};
