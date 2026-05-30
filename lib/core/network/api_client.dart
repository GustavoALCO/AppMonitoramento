import 'dart:typed_data';

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

  Future<Uint8List> getFile(
  String endpoint, {
  required Map<String, dynamic> body,
  Map<String, dynamic>? headers,
}) async {
  final response = await dio.post(
    endpoint,
    data: body,
    options: Options(
      headers: headers,
      responseType: ResponseType.bytes,
    ),
  );

  final data = response.data;

  if (data is Uint8List) return data;

  if (data is List<int>) return Uint8List.fromList(data);

  throw Exception("Resposta inválida para arquivo: ${data.runtimeType}");
}

  // POST
  Future<Map<String, dynamic>> post(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await dio.post(
        endpoint,
        data: body,
        options: Options(headers: headers),
      );
      // Força String para as chaves e int/dynamic para os valores
      return <String, dynamic>{
        'statusCode': response.statusCode, // int
        'data': response.data, // dynamic
      };
    } on DioException catch (e) {

      return <String, dynamic>{
        'statusCode': e.response?.statusCode ?? 0,
        'data': e.response?.data ?? e.message,
      };
    }
  }

  // POST
  Future<dynamic> login(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.post(
      endpoint,
      data: body,
      options: Options(headers: headers),
    );
    return response.data;
  }

  Future<dynamic> verifyjwt(
    String endpoint,
    Map<String, dynamic>? headers,
  ) async {
    final response = await dio.get(
      endpoint,
      options: Options(headers: headers),
    );
    return response.statusCode;
  }

  // PATCH
  Future<dynamic> patch(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    final response = await dio.patch(
      endpoint,
      data: body,
      options: Options(headers: headers),
    );
    return response.statusCode;
  }

  // DELETE
  Future<dynamic> delete(String endpoint, Map<String, dynamic>? headers) async {
    final response = await dio.delete(
      endpoint,
      options: Options(headers: headers),
    );
    return response.statusCode;
  }
}
