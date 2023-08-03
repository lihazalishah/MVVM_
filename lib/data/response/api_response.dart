import 'package:mvvm_app/data/response/status.dart';

class ApiResponse<T> {
  //T is used for dynamic data(pass anything)
  Status? status; // Status is enum define in status.dart page
  T? data;
  String? message;

  ApiResponse(this.status, this.data, this.message); //constructor

// passing reesponse with the help of Status(enum)
  ApiResponse.loading() : status = Status.LODING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

//if response is error it will pass to AppException class
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    // return data
    return '$status,$data,$message';
  }
}
