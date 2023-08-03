// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_app/model/user_model.dart';
import 'package:mvvm_app/repository/auth_repository.dart';
import 'package:mvvm_app/utilities/routes/routes_name.dart';
import 'package:mvvm_app/utilities/utils/utils.dart';
import 'package:mvvm_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  bool _SignUploading = false;
  bool get SignUploading => _SignUploading;

  setSignupLoading(bool value) {
    _SignUploading = value;
    notifyListeners();
  }

  Future<void> LoginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.LogInApi(data).then((value) {
      setLoading(false);
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      userPreference.saveUser(UserModel(token: value['token'].toString()));
      Uitils.flashBarSucessMessage('Login sucessful', context);
      if (kDebugMode) {
        print(value.toString());
      }
      Timer(const Duration(seconds: 2), () {
        Navigator.pushNamed(context, RoutesName.home);
      });
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Uitils.flashBarErrorMessage(error.runtimeType.toString(), context);
        print(error.toString());
        setLoading(false);
      }
    });
  }

  Future<void> SignUpApi(dynamic data, BuildContext context) async {
    setSignupLoading(true);
    _myRepo.SignUpApi(data).then((value) {
      if (kDebugMode) {
        setSignupLoading(false);
        Uitils.flashBarSucessMessage('SignUp sucessful', context);
        print(value.toString());
        Timer(const Duration(seconds: 2), () {
          Navigator.pushNamed(context, RoutesName.login);
        });
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        Uitils.flashBarErrorMessage(error.runtimeType.toString(), context);
        print(error.toString());
        setSignupLoading(false);
      }
    });
  }
}

// line 12 : AuthRepository authenticate our req by passing data into request(get/post)
// line 17 : dynamic data come from loginscreen
// line 24 : if login sucessfull go to home page
//line 37 : call userviewModel
//line 38 : if userlogin save its data dont do to login screen until logout