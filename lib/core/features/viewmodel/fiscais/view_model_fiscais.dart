import 'package:flutter/material.dart';
import 'package:monitoramento/core/features/data/fiscais/fiscais_service.dart';
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

  Future<List<FiscaisModel>> loadFiscais() async {
  isLoading = true;
  errorMessage = null;
  notifyListeners();

  try {
    fiscais = await _serviceFiscais.getFiscais();
    return fiscais;
  } catch (e) {
    errorMessage = 'Erro ao carregar fiscais: $e';

    return []; 
  } finally {
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
  
}
