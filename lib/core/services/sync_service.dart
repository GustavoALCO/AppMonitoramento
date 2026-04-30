import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:monitoramento/app/shared/enums/enumSharedMode.dart';
import 'package:monitoramento/app/shared/enums/enumStatusMode.dart';
import 'package:monitoramento/core/features/data/evidencias/evidencias_service.dart';
import 'package:monitoramento/core/features/models/evidencias/create_evidencias_model.dart';
import 'package:monitoramento/core/features/models/evidencias/update_evidencias_model.dart';
import 'package:monitoramento/core/network/api_client.dart';
import 'package:monitoramento/core/services/bd_evidencias_service.dart';
import 'package:monitoramento/core/services/image_service.dart';

class SyncService {
  static final SyncService instance = SyncService._internal();

  SyncService._internal();

  final Connectivity _connectivity = Connectivity();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  final BdEvidenciasService _bd = BdEvidenciasService();
  final EvidenciasService _service = EvidenciasService(ApiClient());
  final ImageService _imageService = ImageService();

  bool _isSyncing = false;
  bool _started = false;

  /// inicia o serviço
  void start() {
    if (_started) return;

    _started = true;

    sincronizar();

    _subscription = _connectivity.onConnectivityChanged.listen((result) async {
      if (result.contains(ConnectivityResult.none)) {
        return;
      }

      if (await _temInternet()) {
        sincronizar();
      }
    });
  }

  Future<bool> _temInternet() async {
    try {
      final List<ConnectivityResult> results = await Connectivity()
          .checkConnectivity();
      // Retorna true se a lista de conexões contém Wi-Fi
      return results.contains(ConnectivityResult.wifi);
    } catch (_) {
      return false;
    }
  }

  /// sincronização principal
  Future<void> sincronizar() async {

    
    if (_isSyncing) {
      return;
    }

    if (!await _temInternet()) {
      return;
    }

    _isSyncing = true;

    try {
      final evidencias = await _bd.buscarEvidencias();
      //Loop para verificar se há mais de 1 dia a evidencia no celular
      for (var evi in evidencias) {
        if (evi.status != StatusMode.local) {
          // Se a evidencia já foi enviada e tiver vais de 1 dia
          if (evi.status == StatusMode.enviado) {
            final agora = DateTime.now();

            if (agora.difference(evi.horario!).inHours >= 24) {
              await _bd.excluirEvidencia(evi.evidenciaId);
              continue;
            }
          }
        }

        try {
          if (evi.action.index == SharedMode.create.index &&
              evi.status.index != StatusMode.enviado.index) {
            await _enviarCreate(evi);
          } else if (evi.action.index == SharedMode.update.index &&
              evi.status.index != StatusMode.enviado.index) {
            await _enviarUpdate(evi);
          }
          // ignore: empty_catches
        } catch (e) {
          _bd.alterarStatus(evi.evidenciaId, StatusMode.erro);
        }
      }
      // ignore: empty_catches
    } catch (e) {}

    _isSyncing = false;
  }

  /// envia evidência nova
  Future<void> _enviarCreate(dynamic evi) async {
    List<String> base64 = [];

    /// converte json -> lista
    List<String> imagens = _bd.converterImagens(evi.image);

    for (var path in imagens) {
      if (File(path).existsSync()) {
        final imageBase64 = await _imageService.convertImageBase64(path);

        base64.add(imageBase64);
      }
    }

    final model = CreateEvidenciasModel(
      evidenciarotaID: evi.evidenciaId,
      rotaId: evi.idRota,
      fiscalId: evi.idFiscal,
      descricao: evi.descricao,
      dataHora: evi.horario,
      identificacao: evi.identificacao,
      endereco: evi.endereco,
      cidade: evi.cidade,
      latitude: evi.lat,
      longitude: evi.long,
      alimentador: evi.alimentador,
      base64: base64,
      tema: evi.tema.index,
      emergencial: evi.emergencial,
    );

    try {
      final sucesso = await _service.post(model);

      if (sucesso) {
        await _bd.alterarStatus(evi.evidenciaId, StatusMode.enviado);
      } else {
        await _bd.alterarStatus(evi.evidenciaId, StatusMode.erro);
      }
    } catch (e) {
      await _bd.alterarStatus(evi.evidenciaId, StatusMode.erro);
    }
  }

  /// atualiza evidência
  Future<void> _enviarUpdate(dynamic evi) async {
    final model = UpdateEvidenciasModel(
      evidenciaID: evi.evidenciaId,
      descricao: evi.descricao,
      identificacao: evi.identificacao,
      endereco: evi.endereco,
      alimentador: evi.alimentador,
      tema: evi.tema.index,
      emergencial: evi.emergencial,
    );

    final sucesso = await _service.patch(model);

    if (sucesso) {
      await _bd.alterarStatus(evi.evidenciaId, StatusMode.enviado);
    } else {
      await _bd.alterarStatus(evi.evidenciaId, StatusMode.erro);
    }
  }

  /// finaliza serviço
  void dispose() {
    _subscription?.cancel();
  }
}
