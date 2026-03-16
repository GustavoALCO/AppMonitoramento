import 'package:monitoramento/core/features/models/fiscais/fiscais_model.dart';
import 'package:monitoramento/core/features/models/fiscais/login_fiscal_model.dart';
import 'package:monitoramento/core/features/models/fiscais/update_fiscais_model.dart';
import 'package:monitoramento/core/network/api_client.dart';
import 'package:monitoramento/core/network/api_routes.dart';
import 'package:monitoramento/core/services/token_service.dart';

class FiscaisService {
  final ApiClient _apiClient;
  final jwt = TokenService();
  FiscaisService(this._apiClient);

  // Método para obter a lista de fiscais
  Future<List<FiscaisModel>> getFiscais() async {
    // Faz a requisição GET para o endpoint de fiscais
    final data = await _apiClient.get(ApiRoutes.fiscais, null, {
      "Authorization": "Bearer ${await jwt.returnToken()}",
      "Content-Type": "application/json",
    });
    // Converte a resposta em uma lista de objetos FiscaisModel
    return (data as List<FiscaisModel>).map((json) => json).toList();
  }

  // // Método para criar um novo fiscal
  // Future<String> createFiscal(CreateFiscaisModel data) async {
  //   // Faz a requisição POST para o endpoint de fiscais, passando os dados do novo fiscal no corpo da requisição
  //   final response = await _apiClient.post(
  //     ApiRoutes.fiscais,
  //     body: data.toJson(),
  //     headers: {
  //       "Authorization": "Bearer ${await jwt.returnToken()}",
  //       "Content-Type": "application/json",
  //     },
  //   );
  //   // Retorna a resposta da API (pode ser uma mensagem de sucesso ou o ID do novo fiscal criado)
  //   return response.statusCode.toString();
  // }

  // Método para deletar um fiscal
  Future<String> deleteFiscal(int id) async {
    // Faz a requisição DELETE para o endpoint de fiscais, passando o ID do fiscal a ser deletado
    final response = await _apiClient.delete('${ApiRoutes.fiscais}/$id', {
      "Authorization": "Bearer ${await jwt.returnToken()}",
      "Content-Type": "application/json",
    });
    // Retorna a resposta da API (pode ser uma mensagem de sucesso ou um status code)
    return response.statusCode.toString();
  }

  // Método para atualizar um fiscal
  Future<String> updateFiscal(UpdateFiscaisModel data) async {
    // Faz a requisição PUT para o endpoint de fiscais, passando o ID do fiscal a ser atualizado e os dados atualizados no corpo da requisição
    final response = await _apiClient.patch(
      ApiRoutes.fiscais,
      body: data.toJson(),
      headers: {
      "Authorization": "Bearer ${await jwt.returnToken()}",
      "Content-Type": "application/json",
    },
    );
    // Retorna a resposta da API (pode ser uma mensagem de sucesso ou um status code)
    return response.statusCode.toString();
  }

  Future<String> login(LoginFiscalModel data) async {
    // Faz a requisição POST para o endpoint de login, passando os dados de login no corpo da requisição
    final response = await _apiClient.login(
      ApiRoutes.login,
      body: data.toJson(),
    );
    // Retorna a resposta da API 
    return response;
  }
}
