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

  /// verifica internet real
  Future<bool> _temInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
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

      for (var evi in evidencias) {
        if (evi.status != StatusMode.local) {
          final agora = DateTime.now();

          

          if (agora.difference(evi.horario).inHours >= 24) {
            await _bd.excluirEvidencia(evi.idEvi);
            continue;
          }
        }

        try {
          if (evi.action.index == SharedMode.create.index &&
              evi.status.index == StatusMode.local.index) {
            await _enviarCreate(evi);
          }

          if (evi.action.index == SharedMode.update.index) {
            await _enviarUpdate(evi);
          }
          // ignore: empty_catches
        } catch (e) {
          _bd.alterarStatus(evi.idEvi, StatusMode.erro);
        }
      }
      // ignore: empty_catches
    } catch (e) {}

    _isSyncing = false;
  }

  /// envia evidência nova
  Future<void> _enviarCreate(dynamic evi) async {
    String base64 = "";

    if (evi.image.isNotEmpty && File(evi.image).existsSync()) {
      base64 = await _imageService.convertImageBase64(evi.image);
    }

    final model = CreateEvidenciasModel(
      rotaId: evi.idRota,
      fiscalId: evi.idFiscal,
      descricao: evi.descricao,
      dataHora: evi.horario,
      identificacao: evi.identificacao ?? "",
      endereco: evi.endereco,
      cep: evi.cep,
      latitude: evi.lat,
      longitude: evi.long,
      alimentador: evi.alimentador ?? "",
      base64: base64,
      tema: evi.tema.index,
    );

    final sucesso = await _service.post(model);

    if (sucesso) {
      await _bd.alterarStatus(evi.idEvi, StatusMode.enviado);
    } else {
      await _bd.alterarStatus(evi.idEvi, StatusMode.erro);
    }
  }

  /// atualiza evidência
  Future<void> _enviarUpdate(dynamic evi) async {
    final model = UpdateEvidenciasModel(
      id: evi.idEvi,
      descricao: evi.descricao,
      identificacao: evi.identificacao,
      endereco: evi.endereco,
      alimentador: evi.alimentador,
      tema: evi.tema.index,
    );

    final sucesso = await _service.patch(model);

    if (sucesso) {
      await _bd.alterarStatus(evi.idEvi, StatusMode.enviado);
    } else {
      await _bd.alterarStatus(evi.idEvi, StatusMode.erro);
    }
  }

  /// finaliza serviço
  void dispose() {
    _subscription?.cancel();
  }
}
