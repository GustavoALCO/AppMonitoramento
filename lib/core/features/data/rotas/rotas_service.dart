import 'package:monitoramento/core/features/models/rotas/create_rotas_model.dart';
import 'package:monitoramento/core/features/models/rotas/get_filters_rotas_model.dart';
import 'package:monitoramento/core/features/models/rotas/manage_rota_fiscais_model.dart';
import 'package:monitoramento/core/features/models/rotas/rotas_model.dart';
import 'package:monitoramento/core/features/models/rotas/update_rotas_model.dart';
import 'package:monitoramento/core/network/api_client.dart';
import 'package:monitoramento/core/network/api_routes.dart';

class RotasService 
{
  final ApiClient _apiClient;

  RotasService(this._apiClient);

  // Método para obter as rotas com base nos filtros fornecidos
  Future<List<RotasModel>> getRotas(GetFiltersRotasModel filters) async {
    // Faz a requisição GET para o endpoint de rotas, passando os filtros como query parameters
    final data = await _apiClient.get(ApiRoutes.rota, filters: filters.toQuery() );
    // Converte a resposta em uma lista de objetos RotasModel
    return (data as List).map((json) => RotasModel.fromJson(json)).toList();
  }

  Future<String> deleteRota(int id) async {
    // Faz a requisição DELETE para o endpoint de rotas, passando o ID da rota a ser deletada
    final response = await _apiClient.delete('${ApiRoutes.rota}/$id');
    
    // Retorna a resposta da API (pode ser uma mensagem de sucesso ou um status code)
    return response.statusCode.toString();
  }

  Future<String> post(CreateRotasModel data) async {
    // Faz a requisição POST para o endpoint de rotas, passando os dados da nova rota no corpo da requisição
    final response = await _apiClient.post(ApiRoutes.rota, body: data.toJson());
    
    // Retorna a resposta da API (pode ser uma mensagem de sucesso ou o ID da nova rota criada)
    return response.statusCode.toString();
  }

  Future<String> adicionarFiscalRota(ManageRotaFiscaisModel data) async {
    // Faz a requisição POST para o endpoint de rotas, passando os dados para adicionar um fiscal à rota
    final response = await _apiClient.patch('${ApiRoutes.rota}/AddFiscais', body: data.toJson());
    
    // Retorna a resposta da API (pode ser uma mensagem de sucesso ou o ID do fiscal adicionado)
    return response.statusCode.toString();
  }

  Future<String> removerFiscalRota(ManageRotaFiscaisModel data) async {
    // Faz a requisição DELETE para o endpoint de rotas, passando os dados para remover um fiscal da rota
    final response = await _apiClient.patch('${ApiRoutes.rota}/RemoverFiscais', body: data.toJson());
    
    // Retorna a resposta da API (pode ser uma mensagem de sucesso ou o ID do fiscal removido)
    return response.statusCode.toString();
  }

  Future<String> update(UpdateRotasModel data) async {
    // Faz a requisição PUT para o endpoint de rotas, passando os dados atualizados da rota no corpo da requisição
    final response = await _apiClient.patch(ApiRoutes.rota, body: data.toJson());
    
    // Retorna a resposta da API (pode ser uma mensagem de sucesso ou o ID da rota atualizada)
    return response.statusCode.toString();
  }

  Future<RotasModel> getRotaById(int id) async {
    // Faz a requisição GET para o endpoint de rotas, passando o ID da rota a ser obtida
    final data = await _apiClient.get('${ApiRoutes.rota}/$id');
    
    // Converte a resposta em um objeto RotasModel
    return RotasModel.fromJson(data);
  }

  Future<String> deleteRotaById(int id) async {
    // Faz a requisição DELETE para o endpoint de rotas, passando o ID da rota a ser deletada
    final response = await _apiClient.delete('${ApiRoutes.rota}/$id');
    
    // Retorna a resposta da API (pode ser uma mensagem de sucesso ou um status code)
    return response.statusCode.toString();
  }

  Future<String> createRota(CreateRotasModel data) async {
    // Faz a requisição POST para o endpoint de rotas, passando os dados da nova rota no corpo da requisição
    final response = await _apiClient.post(ApiRoutes.rota, body: data.toJson());
    
    // Retorna a resposta da API (pode ser uma mensagem de sucesso ou o ID da nova rota criada)
    return response.statusCode.toString();
  }
}