import 'package:dio/dio.dart';
import 'package:e_commerce/core/resources/constants_manager.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  late Dio dio;

  ApiManager() {
    dio = Dio();
  }
  Future<Response> getData(String endPoint,
      {Map<String, dynamic>? queryParameters}) {
    return dio.get(ConstantsManager.baseUrl + endPoint,
        queryParameters: queryParameters);
  }

  Future<Response> postDate(String endPoint,
      {Map<String, dynamic>? body, Map<String, dynamic>? headers}) {
    return dio.post(ConstantsManager.baseUrl + endPoint,
        data: body, options: Options(headers: headers));
  }
}
