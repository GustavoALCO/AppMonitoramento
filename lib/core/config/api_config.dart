import 'package:dio/dio.dart';

class ApiConfig {
  static Dio get client {
    // Instancia o Dio para fazer a requisição HTTP
    final dio = Dio();

    // Configura a URL base para as requisições
    dio.options.baseUrl = 'https://f5df-2804-14c-1a5-8930-40d3-f3f2-a579-f896.ngrok-free.app';

    // Retorna a instância do Dio configurada
    return dio;
  }
}