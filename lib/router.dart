import 'package:flutter/material.dart';
import 'package:studyed/pages/dashboard/dashboard.dart';
import 'package:studyed/pages/institute/institute_home.dart';
import 'package:studyed/pages/login/login.dart';
import 'package:studyed/pages/onBoarding/on_boarding.dart';
import 'package:studyed/pages/register/register.dart';

class Router {
  Router._();

  static const String homeRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String onBoardingRoute = '/welcome';
  static const String dashboard = '/home';
  static const String institute = '/institute';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case registerRoute:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case loginRoute:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case onBoardingRoute:
        return MaterialPageRoute(builder: (_) => OnBoardingScreen());
      case dashboard:
        return MaterialPageRoute(builder: (_) => DashboardPage());
      case institute:
        return MaterialPageRoute(builder: (_) => InstituteHome());
      default:
        return MaterialPageRoute(
          builder: (_) => Container(
            child: Center(child: Text('404')),
          ),
        );
    }
  }
}
