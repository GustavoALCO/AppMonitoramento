import 'package:dio/dio.dart';
import 'package:monitoramento/core/config/api_config.dart';

class ApiClient {
  final Dio dio;

  ApiClient() : dio = ApiConfig.client;

  // GET com filtros opcionais
  Future<dynamic> get(String endpoint, {Map<String, dynamic>? filters}) async {
    final response = await dio.get(endpoint, queryParameters: filters);
    return response.data;
  }

  // POST
  Future<dynamic> post(String endpoint, {required Map<String, dynamic> body}) async {
    final response = await dio.post(endpoint, data: body);
    return response.statusCode;
  }

  // POST
  Future<dynamic> login(String endpoint, {required Map<String, dynamic> body}) async {
    final response = await dio.post(endpoint, data: body);
    return response.data;
  }

  // PATCH
  Future<dynamic> patch(String endpoint, {required Map<String, dynamic> body}) async {
    final response = await dio.patch(endpoint, data: body);
    return response.statusCode;
  }

  // DELETE
  Future<dynamic> delete(String endpoint) async {
    final response = await dio.delete(endpoint);
    return response.statusCode;
  }
}