// ignore_for_file: avoid_print

import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://api.soom.net.sa/soom/api/v1/users/',
        headers: {
          'Accept-Language': 'ar',
          'Accept': 'application/json',
        },
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        }));
  }

  static Future<Response> getData({
    required url,
    Map<String, dynamic>? qurey,
  }) async {
    return await dio.get(url, queryParameters: qurey);
  }

  static Future<Response> getLoggedUserData({
    required url,
    String? token,
    Map<String, dynamic>? qurey,
  }) async {
    var headers = {"Authorization": (token != null) ? "Bearer $token" : ''};

    dio.options.headers.addAll(headers);

    return await dio.get(url, queryParameters: qurey);
  }

  static Future<Response> postData({
    required String url,
    FormData? formData,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    return dio.post(
      url,
      queryParameters: query,
      data: formData ?? data,
    );
  }

  static Future<Response> postLoggedUser({
    required String url,
    String? token,
    FormData? formData,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
  }) async {
    dio.options.headers["Authorization"] = "Bearer $token";
    return dio.post(
      url,
      data: formData ?? data,
      queryParameters: query,
    );
  }

  static Future<Response> putData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
  }) async {
    dio.options.headers = {
      'lang': lang,
      'Authorization': token ?? '',
      'Content-Type': 'application/json',
    };

    return dio.put(
      url,
      queryParameters: query,
      data: data,
    );
  }

  // static dioErroHandling(DioError e) {
  //   switch (e.type) {
  //     case DioErrorType.connectTimeout:
  //       print("Dio connectTimeout");
  //       break;
  //     case DioErrorType.response:
  //       print("Server Error ");
  //       break;
  //     case DioErrorType.sendTimeout:
  //       print("dio TimeOut");
  //       break;
  //     case DioErrorType.receiveTimeout:
  //       break;
  //     case DioErrorType.cancel:
  //       break;
  //     case DioErrorType.other:
  //       break;
  //   }
  // }
}
