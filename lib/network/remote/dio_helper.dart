import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(BaseOptions(
      //z dio need to things first thing z base url
      // and the status when the data come {done , have error}
      baseUrl: 'https://newsapi.org/',
      receiveDataWhenStatusError: true,
    ));
    if (kDebugMode) {
      print('Dio is created');
    }
  }

  //this method 4 get data from the api and his type is future why b may be wait data
  static Future<Response> getData(
      {required String url, required dynamic query}) async {
    return await dio!.get(url, queryParameters: query);
  }
}
