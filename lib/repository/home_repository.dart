// ignore_for_file: use_rethrow_when_possible, prefer_final_fields, non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:mvvm_app/data/network/BaseApiServices.dart';
import 'package:mvvm_app/data/network/NetworkApiServices.dart';
import 'package:mvvm_app/model/movie_list_model.dart';
import 'package:mvvm_app/resources/components/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<MovieListModel> fetchMoovieslist() async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.MovieslistEndpoint);
      if (kDebugMode) {
        print('at home repo return response ${response}');
      }
      return response = MovieListModel.fromJson(response[8]);
    } catch (e) {
      if (kDebugMode) {
        print('at excption at home repo');
      }
      throw e;
    }
  }
}
