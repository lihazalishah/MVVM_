// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mvvm_app/data/app_Exceptions.dart';
import 'package:mvvm_app/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    final responseJson;
    try {
      final response =
          (await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10)));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    print('at return response');
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;

    try {
      Response response = await post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connectioon');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    print(response.statusCode);
    switch (response.statusCode) {
      case 200: // valid response
        final responseJson = jsonDecode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      default:
        throw FetchDataException(
            'Error accured while communicating with server with server ststus code ${response.statusCode.toString()}');
    }
  }
}


//line 16 // pass url throught variable url and also set timeout
//line 19,34  // call responseReturn method define below
//line 20,35 //SocketException for no internet
//line 21,36 ,55 //FetchDataException call here define in AppException