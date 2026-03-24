// ignore_for_file: unnecessary_null_comparison
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/dto/evidenciaDto.dart';
import 'package:monitoramento/app/shared/enums/enumStatusMode.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';
import 'package:monitoramento/app/shared/widgets/AppbarComponent.dart';
import 'package:monitoramento/app/shared/widgets/ListRevisaoComponent.dart';
import 'package:monitoramento/core/features/data/evidencias/evidencias_service.dart';
import 'package:monitoramento/core/features/models/evidencias/evidencias_model.dart';
import 'package:monitoramento/core/network/api_client.dart';
import 'package:monitoramento/core/services/bd_evidencias_service.dart';
import 'package:monitoramento/core/services/sync_service.dart';
import 'package:monitoramento/core/services/token_service.dart';

class Revisaopage extends StatefulWidget {
  final int id;

  const Revisaopage({super.key, required this.id});

  @override
  State<Revisaopage> createState() => _RevisaopageState();
}

class _RevisaopageState extends State<Revisaopage> {
  late BdEvidenciasService _service;
  late ApiClient _apiClient;
  late EvidenciasService _evidenciasService;
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
      identificacao: evi.identificacao,
      alimentador: evi.alimentador,
      lowImage: evi.lowImageUrl,
      mediumImage: evi.mediumImageUrl,
      originalImage: evi.lowImageUrl,
      horario: evi.horario.toString(),
      latitude: evi.latitude,
      longitude: evi.longitude,
      tema: evi.temaFiscalizacao,
      status: StatusMode.enviado,
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

      //verifica se o valor passado é maior que igual a 0 
      bool atingiuLimite  = evicloud.length / 2 > 0;

      //caso não for maior manda buscar mais evidencias no local
      if (atingiuLimite)
      {
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

    var evilocal = await _service.buscarEvidenciasID(widget.id);

    final fiscal = await _tokenService.getNameFiscal() ?? "";

    if (evilocal.isEmpty) return;

    for (var evi in evilocal) {
      listaTemp.add(
        EvidenciaCardDto(
          idEvi: evi.evidenciaId,
          rotaId: evi.idRota,
          fiscal: fiscal,
          descricao: evi.descricao,
          endereco: evi.endereco,
          identificacao: evi.identificacao,
          alimentador: evi.alimentador,
          originalImage: List<String>.from(jsonDecode(evi.image)),
          horario: "${evi.horario}Z",
          latitude: evi.lat,
          longitude: evi.long,
          tema: evi.tema,
          status: StatusMode.local,
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
        padding: const EdgeInsets.all(16),
        child: Builder(
          builder: (_) {
            if (isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (revisoes.isEmpty) {
              return const Center(child: Text("Nenhuma evidência encontrada"));
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
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirCriarEvidencia,
        backgroundColor: AppColors.cards,
        child: const Icon(Icons.add, color: AppColors.secondary),
      ),
    );
  }
}
