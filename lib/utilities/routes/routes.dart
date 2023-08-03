import 'package:flutter/material.dart';
import 'package:mvvm_app/utilities/routes/routes_name.dart';
import 'package:mvvm_app/view/login_Screen.dart';
import 'package:mvvm_app/view/sigUp_Screen.dart';
import 'package:mvvm_app/view/splash_Screen.dart';

import '../../view/Home_Screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              const Splashscreen(), // home screen route
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              const HomeScreen(), // home screen route
        );

      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              const LoginScreen(), // login screen route
        );
      case RoutesName.signUp:
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              const SignUpScreen(), // login screen route
        );

      default:
        return MaterialPageRoute(builder: (_) {
          return const Splashscreen();
          // return const Scaffold(
          //   body: Center(
          //     child: Text('No routes define'),
          //   ),
          // );
        });
    }
  }
}
