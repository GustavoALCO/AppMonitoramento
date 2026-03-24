import 'package:dio/dio.dart';

class ApiConfig {
  static Dio get client {
    // Instancia o Dio para fazer a requisição HTTP
    final dio = Dio();

    // Configura a URL base para as requisições
    dio.options.baseUrl = 'http://4.228.59.66:8080/';

    // Retorna a instância do Dio configurada
    return dio;
  }
}