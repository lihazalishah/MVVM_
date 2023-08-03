// ignore_for_file: use_build_context_synchronously

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_app/model/user_model.dart';
import 'package:mvvm_app/utilities/routes/routes_name.dart';
import 'package:mvvm_app/view_model/user_view_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();
  void checkAuth(BuildContext context) async {
    getUserData().then((value) async {
      if (kDebugMode) {
        print(value.token);
      }
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}

//line 8: getuser form model
//line 9: function check for user authentication
//line 14: after time goto screen