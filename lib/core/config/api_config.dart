import 'package:dio/dio.dart';

class ApiConfig {
  static Dio get client {
    // Instancia o Dio para fazer a requisição HTTP
    final dio = Dio();

    // Configura a URL base para as requisições
    dio.options.baseUrl = 'https://c7a1-2804-14c-1a5-8930-b46f-cf5e-9d8a-736d.ngrok-free.app';

    // Retorna a instância do Dio configurada
    return dio;
  }
}