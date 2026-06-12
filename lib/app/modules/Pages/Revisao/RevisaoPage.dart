// ignore_for_file: unnecessary_null_comparison
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/dto/evidenciaDto.dart';
import 'package:monitoramento/app/shared/enums/enumFiscalizacao.dart';
import 'package:monitoramento/app/shared/enums/enumSharedMode.dart';
import 'package:monitoramento/app/shared/enums/enumStatusMode.dart';
import 'package:monitoramento/app/shared/enums/enumTemaFiscalicacao.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';
import 'package:monitoramento/app/shared/widgets/AppBarComponent.dart';
import 'package:monitoramento/app/shared/widgets/ButtonDeploy.dart';
import 'package:monitoramento/app/shared/widgets/ListRevisaoComponent.dart';
import 'package:monitoramento/core/features/data/evidencias/evidencias_service.dart';
import 'package:monitoramento/core/features/data/rotas/rotas_service.dart';
import 'package:monitoramento/core/features/models/evidencias/evidencias_model.dart';
import 'package:monitoramento/core/network/api_client.dart';
import 'package:monitoramento/core/services/bd_evidencias_service.dart';
import 'package:monitoramento/core/services/sync_service.dart';
import 'package:monitoramento/core/services/token_service.dart';

class Revisaopage extends StatefulWidget {
  final String id;
  final bool? isfiniched;

  const Revisaopage({super.key, required this.id, this.isfiniched});

  @override
  State<Revisaopage> createState() => _RevisaopageState();
}

class _RevisaopageState extends State<Revisaopage> {
  late BdEvidenciasService _service;
  late ApiClient _apiClient;
  late EvidenciasService _evidenciasService;
  late RotasService _rotasService;
  late TokenService _tokenService;

  List<EvidenciaCardDto> revisoes = [];

  final ScrollController _scrollController = ScrollController();

  int paginaAtual = 1;
  final int pageSize = 2;

  bool isRequesting = false;
  bool isLoading = true;
  bool isLoadingMore = false;
  bool hasMore = true;

  String? error;

  @override
  void initState() {
    super.initState();

    _apiClient = ApiClient();
    _evidenciasService = EvidenciasService(_apiClient);
    _rotasService = RotasService(_apiClient);
    _service = BdEvidenciasService();
    _tokenService = TokenService();

    SyncService.instance.start();

    carregarDados();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !isLoadingMore &&
          hasMore &&
          !isRequesting) {
        carregarMais();
      }
    });
  }

  void _finalizar(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          "Confirmar finalização",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        content: const Text("Deseja realmente finalizar esta revisão?"),

        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),

            child: const Text(
              "Cancelar",
              style: TextStyle(color: AppColors.secondary),
            ),
          ),

          TextButton(
            onPressed: () {
              _rotasService.finalizarRota(widget.id);

              Navigator.pop(context);
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                  "Finalizar",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 0.5
                      ..color = AppColors.secondary,
                  ),
                ),
                const Text(
                  "Finalizar",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  EvidenciaCardDto evidenciaApiToDto(EvidenciaModel evi) {
    return EvidenciaCardDto(
      idEvi: evi.evidenciaRotaId,
      rotaId: evi.rotaId,
      fiscal: evi.fiscal,
      descricao: evi.descricao,
      endereco: evi.endereco,
      cidade: evi.cidade ?? "",
      identificacao: evi.identificacao,
      alimentador: evi.alimentador,
      lowImage: evi.lowImageUrl,
      originalImage: evi.lowImageUrl,
      horario: evi.horario.toString(),
      latitude: evi.latitude,
      longitude: evi.longitude,
      tema: evi.temaFiscalizacao,
      subTema: evi.subTemaFiscalizacao,
      status: StatusMode.enviado,
      emergencial: evi.emergencial,
    );
  }

  Future<void> carregarDados() async {
    setState(() => isLoading = true);

    try {
      paginaAtual = 1;

      List<EvidenciaCardDto> listaTemp = [];

      var evicloud = await _evidenciasService.getEvidencias(
        widget.id,
        paginaAtual,
        pageSize,
      );

      if (evicloud.isEmpty) {
        await buscaLocal();
        return;
      }

      /// API
      for (var evi in evicloud) {
        listaTemp.add(evidenciaApiToDto(evi));
      }

      setState(() {
        revisoes = listaTemp;
        isLoading = false;
        hasMore = evicloud.length >= pageSize;
      });
    } catch (e) {
      await buscaLocal();
    }
  }

  Future<void> carregarMais() async {
    if (isLoadingMore || !hasMore) return;

    setState(() => isLoadingMore = true);

    final proximaPagina = paginaAtual + 1;

    try {
      var evicloud = await _evidenciasService.getEvidencias(
        widget.id,
        proximaPagina,
        pageSize,
      );

      List<EvidenciaCardDto> novas = [];

      for (var evi in evicloud) {
        novas.add(evidenciaApiToDto(evi));
      }

      bool atingiuLimite = evicloud.length >= pageSize;

      //caso não for maior manda buscar mais evidencias no local
      if (!atingiuLimite) {
        buscaLocal();
      }

      setState(() {
        paginaAtual = proximaPagina;
        revisoes.addAll(novas);
        hasMore = evicloud.length == pageSize;
        isLoadingMore = false;
      });
    } catch (e) {
      if (hasMore == true) {
        await buscaLocal();
      }

      /// fallback banco
    }
  }

  Future<void> buscaLocal() async {
    List<EvidenciaCardDto> listaTemp = [];

    var evilocal = await _service.buscarEvidenciasIDRota(widget.id);

    final fiscal = await _tokenService.getNameFiscal() ?? "";

    if (evilocal.isEmpty) {
      setState(() {
        isLoading = false;
        hasMore = false;
      });
      return;
    }

    for (var evi in evilocal) {
      if (evi.action.index == SharedMode.update.index) {
        continue;
      }
      listaTemp.add(
        EvidenciaCardDto(
          idEvi: evi.evidenciaId,
          rotaId: evi.idRota,
          fiscal: fiscal,
          descricao: evi.descricao,
          endereco: evi.endereco!,
          cidade: evi.cidade!,
          identificacao: evi.identificacao,
          alimentador: evi.alimentador,
          originalImage: List<String>.from(jsonDecode(evi.image ?? "[]")),
          horario: "${evi.horario}Z",
          latitude: evi.lat ?? 0.0,
          longitude: evi.long ?? 0.0,
          tema: TemaFiscalizacao.values[evi.temaFiscalizacao ?? 0],
          //TEMPORARIO
          subTema: evi.subTemaFiscalizacao != null
              ? (jsonDecode(evi.subTemaFiscalizacao!) as List)
                    .map((e) => SubTemaFiscalizacao.values[e as int])
                    .toList()
              : [],
          status: StatusMode.local,
          emergencial: evi.emergencial,
        ),
      );
    }

    listaTemp.sort((a, b) => a.horario.compareTo(b.horario));

    final horariosJaCarregados = revisoes.map((e) => e.horario).toSet();

    final novas = listaTemp
        .where((e) => !horariosJaCarregados.contains(e.horario))
        .toList();

    setState(() {
      revisoes.addAll(novas);
      isLoading = false;
      hasMore = false;
    });
  }

  Future<void> _excluirEvidencia(String id, StatusMode mode) async {
    try {
      if (mode == StatusMode.enviado) {
        await _evidenciasService.deleteEvidencia(id);
        setState(() {
          // ignore: unrelated_type_equality_checks
          revisoes.removeWhere((e) => e.idEvi == id);
        });
      }

      await _service.excluirEvidencia(id);
      setState(() {
        // ignore: unrelated_type_equality_checks
        revisoes.removeWhere((e) => e.idEvi == id);
      });
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Erro ao Excluir Evidencia. ",
            style: const TextStyle(color: AppColors.cards),
          ),
          backgroundColor: AppColors.secondary,
        ),
      );
    }
  }

  Future<void> _abrirCriarEvidencia() async {
    final result = await Navigator.popAndPushNamed(
      context,
      "/criarEvidencia",
      arguments: widget.id,
    );

    if (result == true) carregarDados();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent("Revisão", false),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 5, 16, 10),
        child: Column(
          children: [
            if (widget.isfiniched != true) ...[
              const SizedBox(height: 16),
              Buttondeploy(
                text: "Finalizar Rota",
                onPressed: () {
                  _finalizar(context);
                },
                select: true,
                iconEnabled: false,
                padding: 5,
              ),
              const SizedBox(height: 10),
            ],
            Expanded(
              child: Builder(
                builder: (_) {
                  if (isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (revisoes.isEmpty) {
                    return const Center(
                      child: Text("Nenhuma evidência encontrada"),
                    );
                  }

                  return ListRevisaoComponent(
                    revisoes: revisoes,
                    onDelete: _excluirEvidencia,
                    controller: _scrollController,
                    isLoadingMore: isLoadingMore,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: widget.isfiniched == true
          ? null
          : FloatingActionButton(
              onPressed: _abrirCriarEvidencia,
              backgroundColor: AppColors.cards,
              child: const Icon(Icons.add, color: AppColors.secondary),
            ),
    );
  }
}
