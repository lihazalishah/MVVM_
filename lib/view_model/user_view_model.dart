import 'package:flutter/foundation.dart';
import 'package:mvvm_app/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    // for logged in
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    if (kDebugMode) {
      print('in getuser $token');
    }
    return UserModel(token: token.toString());
  }

  Future<bool> remove() async {
    // for logout
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return sp.clear();
  }
}


//line 6: get data from UserModel created from login response(we have only token here , if somethging else like name , passward we get with sp. line 8)
//line 7: sharedPrefrences.getInstense() get copy of user data
//line 8: set data(token form usermodel)
//line 15: get data(token form usermodel) and return usermodel with data(token)for loggedin