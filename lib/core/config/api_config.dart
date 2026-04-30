import 'package:dio/dio.dart';

class ApiConfig {
  static Dio get client {
    // Instancia o Dio para fazer a requisição HTTP
    final dio = Dio();

    // Configura a URL base para as requisições
    dio.options.baseUrl = 'https://aef2-2804-38a-a336-6971-a5e1-be5-60ca-fae6.ngrok-free.app';

    // Retorna a instância do Dio configurada
    return dio;
  }
}