import 'dart:async';
import 'dart:convert';
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
import 'package:monitoramento/core/services/internet_service.dart';

class SyncService {
  static final SyncService instance =
      SyncService._internal();

  SyncService._internal();

  final Connectivity _connectivity =
      Connectivity();

  StreamSubscription<List<ConnectivityResult>>?
      _subscription;

  final BdEvidenciasService _bd =
      BdEvidenciasService();

  final EvidenciasService _service =
      EvidenciasService(ApiClient());

  final ImageService _imageService =
      ImageService();

  final InternetService _internetService =
      InternetService();

  bool _isSyncing = false;
  bool _started = false;

  void start() {

    if (_started) {
      return;
    }

    _started = true;


    sincronizar();

    _subscription =
        _connectivity.onConnectivityChanged.listen(
      (List<ConnectivityResult> results) async {


        final internet =
            await _temInternet();

        if (internet) {
          await sincronizar();
        }
      },
    );
  }

  Future<bool> _temInternet() async {

    try {

      final results =
          await _internetService.temInternet();

      return results == true;

    } catch (e) {

      return false;
    }
  }

  /// sincronização principal
  Future<void> sincronizar() async {

    if (_isSyncing) {
      return;
    }

    _isSyncing = true;

    try {

      final internet =
          await _temInternet();

      if (!internet) {

        return;
      }

      final evidencias =
          await _bd.buscarEvidencias();

      for (var evi in evidencias) {

        // Remove enviados após 24h
        if (evi.status != StatusMode.local) {

          if (evi.status ==
              StatusMode.enviado) {

            final agora = DateTime.now();

            final horas =
                agora
                    .difference(evi.horario!)
                    .inHours;


            if (horas >= 24) {

              await _bd.excluirEvidencia(
                evi.evidenciaId,
              );

              continue;
            }
          }
        }

        try {

          if (evi.action.index ==
                  SharedMode.create.index &&
              evi.status.index !=
                  StatusMode.enviado.index) {


            await _enviarCreate(evi);

          } else if (evi.action.index ==
                  SharedMode.update.index &&
              evi.status.index !=
                  StatusMode.enviado.index) {


            await _enviarUpdate(evi);
          }

        } catch (e) {

          await _bd.alterarStatus(
            evi.evidenciaId,
            StatusMode.erro,
          );
        }
      }

    } finally {

      _isSyncing = false;

    }
  }

  /// envia evidência nova
  Future<void> _enviarCreate(dynamic evi) async {

    try {

      List<String> base64 = [];

      /// converte json -> lista
      List<String> imagens =
          _bd.converterImagens(evi.image);

      for (var path in imagens) {


        final exists =
            File(path).existsSync();
        if (exists) {

          final imageBase64 =
              await _imageService
                  .convertImageBase64(path);

          base64.add(imageBase64);

        } else {

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
        tema: evi.temaFiscalizacao,
        subtema:
            (jsonDecode(
              evi.subTemaFiscalizacao,
            ) as List)
                .map(
                  (e) => int.parse(
                    e.toString(),
                  ),
                )
                .toList(),
        emergencial: evi.emergencial,
      );


      final sucesso =
          await _service.post(model);

      if (sucesso) {

        await _bd.alterarStatus(
          evi.evidenciaId,
          StatusMode.enviado,
        );

      } else {

        await _bd.alterarStatus(
          evi.evidenciaId,
          StatusMode.erro,
        );
      }

    } catch (e) {

      await _bd.alterarStatus(
        evi.evidenciaId,
        StatusMode.erro,
      );
    }
  }

  /// atualiza evidência
  Future<void> _enviarUpdate(dynamic evi) async {

    try {

      final model = UpdateEvidenciasModel(
        evidenciaID: evi.evidenciaId,
        descricao: evi.descricao,
        identificacao: evi.identificacao,
        endereco: evi.endereco,
        alimentador: evi.alimentador,
        tema: evi.tema,
        subtema: evi.subtema,
        emergencial: evi.emergencial,
      );


      final sucesso =
          await _service.patch(model);

      if (sucesso) {

        await _bd.alterarStatus(
          evi.evidenciaId,
          StatusMode.enviado,
        );

      } else {

        await _bd.alterarStatus(
          evi.evidenciaId,
          StatusMode.erro,
        );
      }

    } catch (e) {

      await _bd.alterarStatus(
        evi.evidenciaId,
        StatusMode.erro,
      );
    }
  }

  /// finaliza serviço
  void dispose() {

    _subscription?.cancel();

  }
}