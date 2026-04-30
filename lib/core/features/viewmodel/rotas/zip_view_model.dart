import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:monitoramento/core/features/data/rotas/rotas_service.dart';

class ZipViewModel extends ChangeNotifier {
  final RotasService _service;

  ZipViewModel({required RotasService service}) : _service = service;

  bool isLoading = false;
  String? errorMessage;
  File? fileGerado;

  /// 📦 Emergencial
  Future<void> baixarEmergencial(String id) async {
    await _baixar(() async {
      return await _service.downloadEmergencial(id);
    }, 'relatorio_emergencial.zip');
  }

  /// 📦 Relatório
  Future<void> baixarRelatorio(List<String> ids) async {
    await _baixar(() async {
      return await _service.downloadRelatorio(ids);
    }, 'relatorio.zip');
  }

  Future<void> _baixar(Future<dynamic> Function() request, String fileName) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      final raw = await request();
      final bytes = _converterBytes(raw);

      final file = await _criarArquivoPublico(fileName);

      await file.writeAsBytes(bytes, flush: true);


      fileGerado = file;
    } catch (e) {
      errorMessage = 'Erro ao baixar ZIP: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<int> _converterBytes(dynamic data) {
    if (data is Uint8List) return data;
    if (data is List<int>) return data;
    return List<int>.from(data);
  }

  Future<File> _criarArquivoPublico(String fileName) async {
    final dir = Directory('/storage/emulated/0/Download');

    if (!await dir.exists()) {
      await dir.create(recursive: true);
    }

    return File('${dir.path}/$fileName${DateTime.now().millisecondsSinceEpoch}.zip');
  }

  void clear() {
    fileGerado = null;
    errorMessage = null;
    notifyListeners();
  }
}