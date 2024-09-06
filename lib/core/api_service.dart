import 'package:dio/dio.dart';


class ApiService {
  final String _baseUrl = "https://www.googleapis.com/books/v1/";
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> getBooks({required String endpoint}) async {
    //map<string,dynamic>
    var response = await dio.get("$_baseUrl$endpoint");

    return response.data; // response.data
  }

  Future UserLogin(
      {required String userName, required String userPassword}) async {
    FormData userData =
        FormData.fromMap({"username": userName, "password": userPassword});
    try {
      Response UserLogin =
          await Dio().post("https://dummyjson.com/auth/login", data: userData);
      if (UserLogin.statusCode == 200) {
        return "login Success"; // يمكنك معالجة البيانات هنا حسب الحاجة
      } else {
        return "Failed to login";
      }
    } catch (e) {
      if (e is DioException) {
        return e.response?.data["message"] ?? "An error occurred";
      }
      return "An error occurred";
    }
  }
}
