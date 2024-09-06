import 'package:dio/dio.dart';


class ApiService {
  final String _baseUrl = "https://www.googleapis.com/books/v1/";
  final Dio dio;

  ApiService(this.dio);

  Future <Map<String,dynamic>> getBooks({required String endpoint}) async {   //map<string,dynamic>
    var response = await dio.get("$_baseUrl$endpoint");
   /* List<Books> books = [];

    for (var i in response.data["items"]) {
      books.add(Books.fromJson(i));
    }*/

    return  response.data;   // response.data
  }
}