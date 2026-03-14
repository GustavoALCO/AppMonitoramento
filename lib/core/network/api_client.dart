import 'package:dio/dio.dart';
import 'package:monitoramento/core/config/api_config.dart';
import 'package:monitoramento/core/services/token_service.dart';

class ApiClient {
  final Dio dio;

  TokenService token = TokenService();
  ApiClient() : dio = ApiConfig.client;

  // GET com filtros opcionais
  Future<dynamic> get(
    String endpoint,
    Map<String, dynamic>? filters,
    Map<String, dynamic>? headers,
  ) async {
    final response = await dio.get(
      endpoint,
      queryParameters: filters,
      options: Options(headers: headers),
    );
    return response.data;
  }

  // POST
  Future<dynamic> post(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.post(
      endpoint,
      data: body,
      options: Options(headers: headers),
    );
    return response.statusCode;
  }

  // POST
  Future<dynamic> login(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.post(endpoint, data: body, options: Options(headers: headers));
    return response.data;
  }

  Future<dynamic> verifyjwt(String endpoint, Map<String, dynamic>? headers) async {
    final response = await dio.get(endpoint, options: Options(headers: headers));
    return response.statusCode;
  }

  // PATCH
  Future<dynamic> patch(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.patch(endpoint, data: body, options: Options(headers: headers));
    return response.statusCode;
  }

  // DELETE
  Future<dynamic> delete(String endpoint, Map<String, dynamic>? headers,) async {
    final response = await dio.delete(endpoint, options: Options(headers: headers));
    return response.statusCode;
  }
}
