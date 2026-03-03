import 'package:flutter/material.dart';
import 'package:monitoramento/core/features/data/fiscais/fiscais_service.dart';
import 'package:monitoramento/core/features/models/fiscais/create_fiscais_model.dart';
import 'package:monitoramento/core/features/models/fiscais/fiscais_model.dart';
import 'package:monitoramento/core/features/models/fiscais/update_fiscais_model.dart';

class ViewModelFiscais extends ChangeNotifier {
  // declarando o serviço de fiscais
  final FiscaisService _serviceFiscais;
  

  // declarando variaveis de estado do ViewModel
  List<FiscaisModel> fiscais = [];
  bool isLoading = false;
  String? errorMessage;
  

  // construtor
  ViewModelFiscais({required FiscaisService serviceFiscais}) : _serviceFiscais = serviceFiscais;

  // Método para carregar os fiscais
  Future<void> loadFiscais() async {
    // Atualiza o estado para indicar que os dados estão sendo carregados
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Tenta carregar os fiscais usando o serviço, e captura qualquer erro que possa ocorrer
    try {
      // Chama o método do serviço para obter os fiscais
      fiscais = await _serviceFiscais.getFiscais();
    }
    // Se ocorrer um erro durante o carregamento, atualiza o estado com a mensagem de erro
    catch (e) {
      errorMessage = 'Erro ao carregar fiscais: $e';
    }
    // Manda o estado para indicar que o carregamento terminou, seja com sucesso ou com erro
    finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //metodo para deletar um fiscal
  Future<void> deleteFiscal(int id) async {
    // Atualiza o estado para indicar que os dados estão sendo carregados
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Tenta deletar o fiscal usando o serviço, e captura qualquer erro que possa ocorrer
    try {
      // Chama o método do serviço para deletar o fiscal, passando o ID do fiscal a ser deletado
      await _serviceFiscais.deleteFiscal(id);
      // Após deletar, recarrega a lista de fiscais para refletir a mudança
      await loadFiscais();
    }
    // Se ocorrer um erro durante a deleção, atualiza o estado com a mensagem de erro
    catch (e) {
      errorMessage = 'Erro ao deletar fiscal: $e';
    }
    // Manda o estado para indicar que a operação terminou, seja com sucesso ou com erro
    finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //metodo para atualizar um fiscal
  Future<void> updateFiscal(UpdateFiscaisModel data) async {
    // Atualiza o estado para indicar que os dados estão sendo carregados
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Tenta atualizar o fiscal usando o serviço, e captura qualquer erro que possa ocorrer
    try {
      // Chama o método do serviço para atualizar o fiscal, passando os dados atualizados do fiscal
      await _serviceFiscais.updateFiscal(data);
      // Após atualizar, recarrega a lista de fiscais para refletir a mudança
      await loadFiscais();
    }
    // Se ocorrer um erro durante a atualização, atualiza o estado com a mensagem de erro
    catch (e) {
      errorMessage = 'Erro ao atualizar fiscal: $e';
    }
    // Manda o estado para indicar que a operação terminou, seja com sucesso ou com erro
    finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // metodo para criar um novo fiscal
  Future<void> createFiscal(CreateFiscaisModel data) async {
    // Atualiza o estado para indicar que os dados estão sendo carregados
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    // Tenta criar o fiscal usando o serviço, e captura qualquer erro que possa ocorrer
    try {
      // Chama o método do serviço para criar um novo fiscal, passando os dados do novo fiscal
      await _serviceFiscais.createFiscal(data);
      // Após criar, recarrega a lista de fiscais para refletir a mudança
      await loadFiscais();
    }
    // Se ocorrer um erro durante a criação, atualiza o estado com a mensagem de erro
    catch (e) {
      errorMessage = 'Erro ao criar fiscal: $e';
    }
    // Manda o estado para indicar que a operação terminou, seja com sucesso ou com erro
    finally {
      isLoading = false;
      notifyListeners();
    }
  }

  
}
