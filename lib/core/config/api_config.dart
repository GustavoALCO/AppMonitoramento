import 'package:dio/dio.dart';

class ApiConfig {
  static Dio get client {
    // Instancia o Dio para fazer a requisição HTTP
    final dio = Dio();

    // Configura a URL base para as requisições
    dio.options.baseUrl = 'https://b9b8-2804-388-c3d6-46cb-15e-91c4-57f4-548e.ngrok-free.app';

    // Retorna a instância do Dio configurada
    return dio;
  }
}