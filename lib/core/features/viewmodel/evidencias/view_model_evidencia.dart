import 'package:flutter/material.dart';
import 'package:monitoramento/core/features/data/evidencias/evidencias_service.dart';
import 'package:monitoramento/core/features/models/evidencias/evidencias_model.dart';

// ViewModel para a tela de evidências
class ViewModelEvidencia extends ChangeNotifier
{
  //declarando service de evidências
  final EvidenciasService _serviceEvidencia;

  // Variaveis de estado do ViewModel
  List<EvidenciaModel> evidencias = [];
  bool isLoading = false;
  String? errorMessage;

  //construtor
  ViewModelEvidencia({required EvidenciasService serviceEvidencia}) : _serviceEvidencia = serviceEvidencia;

  // Método para carregar as evidências
  Future<void> loadEvidencias(int idFiscal, int page, int pageSize) async {
    // Atualiza o estado para indicar que os dados estão sendo carregados
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Tenta carregar as evidências usando o serviço, e captura qualquer erro que possa ocorrer
    try {
      // Chama o método do serviço para obter as evidências, passando os filtros necessários
      evidencias = await _serviceEvidencia.getEvidencias(idFiscal, page, pageSize);
    } 
      // Se ocorrer um erro durante o carregamento, atualiza o estado com a mensagem de erro
    catch (e) {
      errorMessage = 'Erro ao carregar evidências: $e';
    } 
      // Manda o estado para indicar que o carregamento terminou, seja com sucesso ou com erro
    finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loadEvidenciasid(int id) async {
    // Atualiza o estado para indicar que os dados estão sendo carregados
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Tenta carregar as evidências usando o serviço, e captura qualquer erro que possa ocorrer
    try {
      // Chama o método do serviço para obter as evidências, passando os filtros necessários
      evidencias = await _serviceEvidencia.getEvidenciasid(id);
    } 
      // Se ocorrer um erro durante o carregamento, atualiza o estado com a mensagem de erro
    catch (e) {
      errorMessage = 'Erro ao carregar evidências: $e';
    } 
      // Manda o estado para indicar que o carregamento terminou, seja com sucesso ou com erro
    finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Método para limpar os dados do ViewModel
  void clearEvidencias() {
    evidencias.clear();
    errorMessage = null;
    isLoading = false;
    notifyListeners();
  }

  void deleteEvidencia(int id,int idFiscal, int page, int pageSize) async {
    try {
      var response = await _serviceEvidencia.deleteEvidencia(id);
      if (response == 200) {
        // Se a exclusão for bem-sucedida, recarrega as evidências para refletir a mudança
        await loadEvidencias(idFiscal, page, pageSize); 
      } else {
        errorMessage = 'Erro ao deletar evidência: Código de resposta $response';
        notifyListeners();
      }
    } catch (e) {
      errorMessage = 'Erro ao deletar evidência: $e';
      notifyListeners();
    }
  }

}