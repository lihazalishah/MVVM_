import 'package:flutter/foundation.dart';
import 'package:mvvm_app/data/response/api_response.dart';
import 'package:mvvm_app/model/movie_list_model.dart';
import 'package:mvvm_app/repository/home_repository.dart';

class HomeScreenViewModel with ChangeNotifier {
  final _myRepo = HomeRepository();
  var moviesList = ApiResponse<MovieListModel>.loading();

  setMovieslist(ApiResponse<MovieListModel> response) {
    if (kDebugMode) {
      // print(' Api response ****${response.toString()}');
    }
    moviesList = response;
    // print(moviesList.data!.toString());
    notifyListeners();
  }

  Future<void> fetchmoviesListApi() async {
    setMovieslist(ApiResponse.loading());
    _myRepo.fetchMoovieslist().then((value) {
      setMovieslist(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMovieslist(ApiResponse.error(error.toString()));
    });
  }
}

//line 7: call homeRepo in _myrepo variable
//line 19:through _myrepo we get method defined in homeRepo and then status if complete or error
//line 8 : call apiResponse class and pass moviesModel and set loading
//line 10: create method and pass Apiresponse with MoviesModel and set movieslist to response

