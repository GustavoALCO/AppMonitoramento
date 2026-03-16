import 'package:flutter/material.dart';
import 'package:monitoramento/core/features/data/rotas/rotas_service.dart';
import 'package:monitoramento/core/features/models/rotas/create_rotas_model.dart';
import 'package:monitoramento/core/features/models/rotas/get_filters_rotas_model.dart';
import 'package:monitoramento/core/features/models/rotas/manage_rota_fiscais_model.dart';
import 'package:monitoramento/core/features/models/rotas/rotas_model.dart';
import 'package:monitoramento/core/features/models/rotas/update_rotas_model.dart';

class ViewModelRotas extends ChangeNotifier
{
  // Instância do serviço de rotas para realizar as operações relacionadas às rotas
  final RotasService _rotasService;

  // Variáveis de estado do ViewModel
  List<RotasModel> rotas = [];
  bool isLoading = false;
  String? errorMessage;

  // Construtor do ViewModel, recebendo o serviço de rotas como dependência
  ViewModelRotas({required RotasService rotasService}) : _rotasService = rotasService;

  // Método para carregar as rotas, utilizando o serviço de rotas
  Future<void> loadRotas(GetFiltersRotasModel filters) async {
    // Atualiza o estado para indicar que os dados estão sendo carregados
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Tenta carregar as rotas usando o serviço, e captura qualquer erro que possa ocorrer
    try {
      // Chama o método do serviço para obter as rotas, passando os filtros necessários
      rotas = await _rotasService.getRotas(filters);
    } 
      // Se ocorrer um erro durante o carregamento, atualiza o estado com a mensagem de erro
    catch (e) {
      errorMessage = 'Erro ao carregar rotas: $e';
    } 
      // Manda o estado para indicar que o carregamento terminou, seja com sucesso ou com erro
    finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // metodo para excluir rota
  void deleteRota(int id, GetFiltersRotasModel filters) async {
    // Atualiza o estado para indicar que os dados estão sendo carregados
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Tenta deletar a rota usando o serviço, e captura qualquer erro que possa ocorrer
    try {
      // Chama o método do serviço para deletar a rota, passando o ID da rota a ser deletada
      await _rotasService.deleteRota(id);
      // Após deletar, recarrega a lista de rotas para refletir a mudança
      await loadRotas(filters);
    } 
      // Se ocorrer um erro durante a deleção, atualiza o estado com a mensagem de erro
    catch (e) {
      errorMessage = 'Erro ao deletar rota: $e';
    } 
      // Manda o estado para indicar que o carregamento terminou, seja com sucesso ou com erro
    finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // Método para limpar os dados do ViewModel
  void clearRotas() {
    rotas.clear();
    errorMessage = null;
    isLoading = false;
    notifyListeners();
  }

  // metodo para criar rota
  Future<void> createRota(CreateRotasModel data, GetFiltersRotasModel filters) async {
    // Atualiza o estado para indicar que os dados estão sendo carregados
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Tenta criar a rota usando o serviço, e captura qualquer erro que possa ocorrer
    try {
      // Chama o método do serviço para criar uma nova rota, passando os dados da nova rota
      //await _rotasService.createRota(data);
      // Após criar, recarrega a lista de rotas para refletir a mudança
      await loadRotas(filters);
    } 
      // Se ocorrer um erro durante a criação, atualiza o estado com a mensagem de erro
    catch (e) {
      errorMessage = 'Erro ao criar rota: $e';
    } 
      // Manda o estado para indicar que o carregamento terminou, seja com sucesso ou com erro
    finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // metodo para atualizar rota
  Future<void> updateRota(UpdateRotasModel data, GetFiltersRotasModel filters ) async {
    // Atualiza o estado para indicar que os dados estão sendo carregados
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Tenta atualizar a rota usando o serviço, e captura qualquer erro que possa ocorrer
    try {
      // Chama o método do serviço para atualizar a rota, passando os dados atualizados da rota
      await _rotasService.update(data);
      // Após atualizar, recarrega a lista de rotas para refletir a mudança
      await loadRotas(filters);
    } 
      // Se ocorrer um erro durante a atualização, atualiza o estado com a mensagem de erro
    catch (e) {
      errorMessage = 'Erro ao atualizar rota: $e';
    } 
      // Manda o estado para indicar que o carregamento terminou, seja com sucesso ou com erro
    finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // metodo para adicionar fiscal a rota
  Future<void> adicionarFiscalRota(ManageRotaFiscaisModel data, int id ) async {
    // Atualiza o estado para indicar que os dados estão sendo carregados
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Tenta adicionar o fiscal à rota usando o serviço, e captura qualquer erro que possa ocorrer
    try {
      // Chama o método do serviço para adicionar um fiscal à rota, passando os dados necessários
      await _rotasService.adicionarFiscalRota(data);
      // Após adicionar, recarrega a lista de rotas para refletir a mudança
      await buscarRotaPorId(id);
    } 
      // Se ocorrer um erro durante a adição, atualiza o estado com a mensagem de erro
    catch (e) {
      errorMessage = 'Erro ao adicionar fiscal à rota: $e';
    } 
      // Manda o estado para indicar que o carregamento terminou, seja com sucesso ou com erro
    finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // metodo para remover fiscal da rota
  Future<void> removerFiscalRota(ManageRotaFiscaisModel data, int id ) async {
    // Atualiza o estado para indicar que os dados estão sendo carregados
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Tenta remover o fiscal da rota usando o serviço, e captura qualquer erro que possa ocorrer
    try {
      // Chama o método do serviço para remover um fiscal da rota, passando os dados necessários
      await _rotasService.removerFiscalRota(data);
      // Após remover, recarrega a lista de rotas para refletir a mudança
      await buscarRotaPorId(id);
    } 
      // Se ocorrer um erro durante a remoção, atualiza o estado com a mensagem de erro
    catch (e) {
      errorMessage = 'Erro ao remover fiscal da rota: $e';
    } 
      // Manda o estado para indicar que o carregamento terminou, seja com sucesso ou com erro
    finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // metodo para buscar rota por id
  Future<void> buscarRotaPorId(int id) async {
    // Atualiza o estado para indicar que os dados estão sendo carregados
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Tenta buscar a rota por ID usando o serviço, e captura qualquer erro que possa ocorrer
    try {
      // Chama o método do serviço para buscar uma rota por ID, passando o ID da rota
      await _rotasService.getRotaById(id);
    } 
      // Se ocorrer um erro durante a busca, atualiza o estado com a mensagem de erro
    catch (e) {
      errorMessage = 'Erro ao buscar rota por ID: $e';
    } 
      // Manda o estado para indicar que o carregamento terminou, seja com sucesso ou com erro
    finally {
      isLoading = false;
      notifyListeners();
    }
  }

}