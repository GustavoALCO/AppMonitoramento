import 'package:flutter/material.dart';
import 'package:monitoramento/core/features/data/fiscais/fiscais_service.dart';
import 'package:monitoramento/core/features/models/fiscais/fiscais_model.dart';
import 'package:monitoramento/core/features/models/fiscais/login_fiscal_model.dart';
import 'package:monitoramento/core/services/token_service.dart';

class ViewModelAuth extends ChangeNotifier {
  final FiscaisService _serviceFiscais;
  final TokenService _tokenService = TokenService();

  // declarando variaveis de estado do ViewModel
  List<FiscaisModel> fiscais = [];
  bool isLoading = false;
  String? errorMessage;

  ViewModelAuth({required FiscaisService serviceFiscais,})
    : _serviceFiscais = serviceFiscais;

  // metodo para realizar login
  Future<bool> login(LoginFiscalModel data) async {
  isLoading = true;
  errorMessage = null;
  notifyListeners();
  try {
    var jwt = await _serviceFiscais.login(data);

    await _tokenService.createToken(jwt);
    
    return true;
  } catch (e) {
    return false;
  } finally {
    isLoading = false;
    notifyListeners();
  }
}
}
