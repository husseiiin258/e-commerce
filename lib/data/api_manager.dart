import 'package:dio/dio.dart';
import 'package:e_commerce/core/resources/constants_manager.dart';

class ApiManager {
   late Dio dio;

  ApiManager() {
    dio = Dio();
  }
   Future<Response> getData(String endPoint ,{Map<String, dynamic>? queryParameters}){
   return dio.get(ConstantsManager.baseUrl+endPoint , queryParameters: queryParameters);
  }

   Future<Response> postDate(String endPoint ,{Map<String, dynamic>? body}){
     return dio.post(ConstantsManager.baseUrl+endPoint , data: body);
   }
}
