import 'dart:typed_data';

import 'package:monitoramento/core/features/models/rotas/create_rotas_model.dart';
import 'package:monitoramento/core/features/models/rotas/get_filters_rotas_model.dart';
import 'package:monitoramento/core/features/models/rotas/manage_rota_fiscais_model.dart';
import 'package:monitoramento/core/features/models/rotas/rotas_model.dart';
import 'package:monitoramento/core/features/models/rotas/update_rotas_model.dart';
import 'package:monitoramento/core/network/api_client.dart';
import 'package:monitoramento/core/network/api_routes.dart';
import 'package:monitoramento/core/services/token_service.dart';

class RotasService {
  final ApiClient _apiClient;
  final jwt = TokenService();
  RotasService(this._apiClient);

  // Método para obter as rotas com base nos filtros fornecidos
  Future<List<RotasModel>> getRotas(GetFiltersRotasModel filters) async {
    // Faz a requisição GET para o endpoint de rotas, passando os filtros como query parameters
    final data = await _apiClient.get(ApiRoutes.rota, filters.toQuery(), {
      "Authorization": "Bearer ${await jwt.returnToken()}",
      "Content-Type": "application/json",
    });
    // Converte a resposta em uma lista de objetos RotasModel
    return (data as List).map((json) => RotasModel.fromJson(json)).toList();
  }

  Future<String> deleteRota(int id) async {
    // Faz a requisição DELETE para o endpoint de rotas, passando o ID da rota a ser deletada
    final response = await _apiClient.delete('${ApiRoutes.rota}/$id', {
      "Authorization": "Bearer ${await jwt.returnToken()}",
      "Content-Type": "application/json",
    });

    // Retorna a resposta da API (pode ser uma mensagem de sucesso ou um status code)
    return response.statusCode.toString();
  }

  Future<void> post(CreateRotasModel data) async {
    // Faz a requisição POST para o endpoint de rotas, passando os dados da nova rota no corpo da requisição
    await _apiClient.post(
      ApiRoutes.rota,
      body: data.toJson(),
      headers: {
        "Authorization": "Bearer ${await jwt.returnToken()}",
        "Content-Type": "application/json",
      },
    );

    // Retorna a resposta da API (pode ser uma mensagem de sucesso ou o ID da nova rota criada)
    return ;
  }

  Future<Uint8List> downloadEmergencial(String id) async {
    // Faz a requisição GET para o endpoint de rotas, passando o ID da rota a ser baixada
    final bytes = await _apiClient.getFile(
      '${ApiRoutes.rota}/CriarEmergencial',
      body: {"idRota": id},
      headers: {
        "Authorization": "Bearer ${await jwt.returnToken()}",
        "Content-Type": "application/json",
      },
    );
    return bytes;
  }

  Future<Uint8List> downloadRelatorio(List<String> id) async {
    // Faz a requisição GET para o endpoint de rotas, passando o ID da rota a ser baixada
    
    final bytes = await _apiClient.getFile(
      '${ApiRoutes.rota}/CriarRelatorio',
      body: {"ids": id.toList()},
      headers: {
        "Authorization": "Bearer ${await jwt.returnToken()}",
        "Content-Type": "application/json",
      },
    );

    return bytes;
  }

  Future<String> adicionarFiscalRota(ManageRotaFiscaisModel data) async {
    // Faz a requisição POST para o endpoint de rotas, passando os dados para adicionar um fiscal à rota
    final response = await _apiClient.patch(
      '${ApiRoutes.rota}/AddFiscais',
      body: data.toJson(),
      headers: {
        "Authorization": "Bearer ${await jwt.returnToken()}",
        "Content-Type": "application/json",
      },
    );

    // Retorna a resposta da API (pode ser uma mensagem de sucesso ou o ID do fiscal adicionado)
    return response.statusCode.toString();
  }

  Future<String> removerFiscalRota(ManageRotaFiscaisModel data) async {
    // Faz a requisição DELETE para o endpoint de rotas, passando os dados para remover um fiscal da rota
    final response = await _apiClient.patch(
      '${ApiRoutes.rota}/RemoverFiscais',
      body: data.toJson(),
      headers: {
        "Authorization": "Bearer ${await jwt.returnToken()}",
        "Content-Type": "application/json",
      },
    );

    // Retorna a resposta da API (pode ser uma mensagem de sucesso ou o ID do fiscal removido)
    return response.statusCode.toString();
  }

  Future<String> update(UpdateRotasModel data) async {
    // Faz a requisição PUT para o endpoint de rotas, passando os dados atualizados da rota no corpo da requisição
    final response = await _apiClient.patch(
      ApiRoutes.rota,
      body: data.toJson(),
      headers: {
        "Authorization": "Bearer ${await jwt.returnToken()}",
        "Content-Type": "application/json",
      },
    );

    // Retorna a resposta da API (pode ser uma mensagem de sucesso ou o ID da rota atualizada)
    return response.statusCode.toString();
  }

  Future<RotasModel> getRotaById(String id) async {
    // Faz a requisição GET para o endpoint de rotas, passando o ID da rota a ser obtida
    final data = await _apiClient.get(
      ApiRoutes.rota,
      {"id": id},
      {
        "Authorization": "Bearer ${await jwt.returnToken()}",
        "Content-Type": "application/json",
      },
    );

    // Converte a resposta em um objeto RotasModel
    return RotasModel.fromJson(data);
  }

  Future<String> deleteRotaById(int id) async {
    // Faz a requisição DELETE para o endpoint de rotas, passando o ID da rota a ser deletada
    final response = await _apiClient.delete('${ApiRoutes.rota}/$id', {
      "Authorization": "Bearer ${await jwt.returnToken()}",
      "Content-Type": "application/json",
    });

    // Retorna a resposta da API (pode ser uma mensagem de sucesso ou um status code)
    return response.statusCode.toString();
  }


  Future<bool> finalizarRota(String rotaId) async {
    // Faz a requisição PATCH para o endpoint de rotas, passando o ID da rota a ser finalizada
    final response = await _apiClient.patch(
      '${ApiRoutes.rota}/FinalizarRota',
      body: {"rotaId": rotaId},
      headers: {
        "Authorization": "Bearer ${await jwt.returnToken()}",
        "Content-Type": "application/json",
      },
    );

    // Retorna True se a resposta da API for 200
    return response.statusCode == 200;
  }
}
