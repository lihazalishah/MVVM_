// ignore_for_file: file_names

//abstrct class is restricted class we can not create object of abstrcat class, (to acces it must be inherited from another class)
// abstract method only created in abstract class,abstract method has not body(body definne in inherited class)
abstract class BaseApiServices {
  Future<dynamic> getGetApiResponse(String url);

  Future<dynamic> getPostApiResponse(String url, dynamic data);
}
