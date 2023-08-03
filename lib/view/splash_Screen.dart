import 'package:flutter/material.dart';
import 'package:mvvm_app/view_model/services/splash_services.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  SplashServices splashServices = SplashServices();
  @override
  void initState() {
    super.initState();
    splashServices.checkAuth(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        'SPLASH SCREEN',
        style: TextStyle(fontSize: 50, fontStyle: FontStyle.italic),
      )),
    );
  }
}

//line 15: call splashService for auth line 19