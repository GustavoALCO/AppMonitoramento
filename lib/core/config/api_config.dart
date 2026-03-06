import 'package:dio/dio.dart';

class ApiConfig {
  static Dio get client {
    // Instancia o Dio para fazer a requisição HTTP
    final dio = Dio();

    // Configura a URL base para as requisições
    dio.options.baseUrl = 'https://84a5-2804-14c-1a5-8930-a5b5-5894-2a0a-af97.ngrok-free.app';

    // Retorna a instância do Dio configurada
    return dio;
  }
}