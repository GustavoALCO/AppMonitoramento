import 'package:monitoramento/core/features/models/evidencias/create_evidencias_model.dart';
import 'package:monitoramento/core/features/models/evidencias/evidencias_model.dart';
import 'package:monitoramento/core/features/models/evidencias/update_evidencias_model.dart';
import 'package:monitoramento/core/network/api_client.dart';
import 'package:monitoramento/core/network/api_routes.dart';
import 'package:monitoramento/core/services/token_service.dart';

class EvidenciasService {
  final ApiClient _apiClient;
  final jwt = TokenService();
  EvidenciasService(this._apiClient);

  // Método para obter as evidências com base nos filtros fornecidos
  Future<List<EvidenciaModel>> getEvidencias(
    // ignore: non_constant_identifier_names
    int IdRota,
    int page,
    int pageSize,
  ) async {
    dynamic data = await _apiClient.get(
      '${ApiRoutes.evidencia}/TodasEvidencias',
      {"IdRota": IdRota, "PageSize": pageSize, "Page": page},
      {
        "Authorization": "Bearer ${await jwt.returnToken()}",
        "Content-Type": "application/json",
      },
    );

    return (data as List).map((json) => EvidenciaModel.fromJson(json)).toList();
  }

  Future<List<EvidenciaModel>> getEvidenciasid(int id) async {
    // Faz a requisição GET para o endpoint de evidências, passando os filtros como query parameters
    final data = await _apiClient.get(ApiRoutes.evidencia, {"id": id}, {
      "Authorization": "Bearer ${await jwt.returnToken()}",
      "Content-Type": "application/json",
    });

    // Converte a resposta em uma lista de strings (ajuste conforme a estrutura real dos dados retornados)
    return (data as List<EvidenciaModel>).map((e) => e).toList();
  }

  Future<int> deleteEvidencia(int id) async {
    // Faz a requisição DELETE para o endpoint de evidências, passando o ID da evidência a ser deletada
    final response = await _apiClient.delete(
      '${ApiRoutes.evidencia}?command=$id',{
      "Authorization": "Bearer ${await jwt.returnToken()}",
      "Content-Type": "application/json",
    });

    return response;
  }

  // Método para criar uma nova evidência
  Future<bool> post(CreateEvidenciasModel data) async {
  await _apiClient.post(
    ApiRoutes.evidencia,
    body: data.toJson(),
    headers: {
      "Authorization": "Bearer ${await jwt.returnToken()}",
      "Content-Type": "application/json",
    },
  );

  return true;
}

  Future<bool> patch(UpdateEvidenciasModel data) async {
    // Faz a requisição PATCH para o endpoint de evidências, passando os dados atualizados da evidência no corpo da requisição
    await _apiClient.patch(ApiRoutes.evidencia,
    body: data.toJson(),
    headers: {
      "Authorization": "Bearer ${await jwt.returnToken()}",
      "Content-Type": "application/json",
    },);
    // retorna a resposta da API alterar a evidência
    return true;
  }
}
