import 'dart:io';

import 'package:cattoosa/core/network%20services/remote/chachhelper.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: '',
        receiveDataWhenStatusError: true,
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
    String lang = 'ar',
    String? token,
    Options? options,
  }) async {
    dio.options.headers = {
      'Authorization': token ?? '',
      'lang': CacheHelper.getData(key: 'language') ??
          Platform.localeName.substring(0, 2),
    };

    return await dio.get(
      url,
      queryParameters: query,
      options: options,
    );
  }

  static Future<Response> postData({
    required String url,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    Options? options,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': CacheHelper.getData(key: 'language') ??
          Platform.localeName.substring(0, 2),
      'Authorization': token ?? '',
    };

    return await dio.post(
      url,
      queryParameters: query,
      data: data,
      options: options,
    );
  }

  static Future<Response> postFormData({
    required String url,
    required FormData formData,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
    Options? options,
  }) async {
    dio.options.headers = {
      'Authorization': token ?? '',
      'lang': CacheHelper.getData(key: 'language') ??
          Platform.localeName.substring(0, 2),
    };

    return await dio.post(
      url,
      queryParameters: query,
      data: formData,
      options: options,
    );
  }

  /// Put Data Function
  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': CacheHelper.getData(key: 'language') ??
          Platform.localeName.substring(0, 2),
      'Authorization': token ?? '',
    };
    return dio.put(
      url,
      data: (data)!,
      queryParameters: query,
    );
  }

  /// Delete data function
  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': CacheHelper.getData(key: 'language') ??
          Platform.localeName.substring(0, 2),
      'Authorization': token ?? '',
    };

    return dio.delete(
      url,
      data: data,
      queryParameters: query,
    );
  }
}
