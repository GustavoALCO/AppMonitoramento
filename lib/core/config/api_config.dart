import 'package:dio/dio.dart';

class ApiConfig {
  static Dio get client {
    // Instancia o Dio para fazer a requisição HTTP
    final dio = Dio();

    // Configura a URL base para as requisições
    dio.options.baseUrl = 'https://5f1e-177-81-229-94.ngrok-free.app';

    // Retorna a instância do Dio configurada
    return dio;
  }
}