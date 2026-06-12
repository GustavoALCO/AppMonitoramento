import 'dart:io';
import 'package:dio/dio.dart';

class ApiConfig {
  static Dio get client {
    final dio = Dio();

    dio.options.baseUrl = 'https://68.211.162.64';

    (dio.httpClientAdapter as dynamic).onHttpClientCreate = (client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
    };

    return dio;
  }
}