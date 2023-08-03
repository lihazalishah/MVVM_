// ignore_for_file: use_rethrow_when_possible, prefer_final_fields, non_constant_identifier_names

import 'package:mvvm_app/data/network/BaseApiServices.dart';
import 'package:mvvm_app/data/network/NetworkApiServices.dart';
import 'package:mvvm_app/resources/components/app_url.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> LogInApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginEndpoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> SignUpApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.SignUpUrlEndpoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
//line 12 loginendpoint is in APPUrl 
// line 8 : BaseApiServices is abtract class in which we define abstract method for getApi and postApi
//line 8 : NetworkApiServices is class extend BaseApiServices and code of abstract method define in this class