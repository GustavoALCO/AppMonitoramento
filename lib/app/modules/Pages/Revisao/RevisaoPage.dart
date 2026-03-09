import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';
import 'package:monitoramento/app/shared/widgets/AppbarComponent.dart';
import 'package:monitoramento/app/shared/widgets/ListRevisaoComponent.dart';
import 'package:monitoramento/core/features/data/evidencias/evidencias_service.dart';
import 'package:monitoramento/core/features/models/evidencias/evidencias_model.dart';
import 'package:monitoramento/core/network/api_client.dart';

class Revisaopage extends StatefulWidget {
  final int id;

  const Revisaopage({super.key, required this.id});

  @override
  State<Revisaopage> createState() => _RevisaopageState();
}

class _RevisaopageState extends State<Revisaopage> {
  late EvidenciasService _service;

  List<EvidenciaModel> revisoes = [];

  final ScrollController _scrollController = ScrollController();

  int paginaAtual = 1;
  final int pageSize = 5;

  bool isLoading = true;
  bool isLoadingMore = false;
  bool hasMore = true;

  String? error;

  @override
  void initState() {
    super.initState();

    _service = EvidenciasService(ApiClient());

    carregarDados();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !isLoadingMore &&
          hasMore) {
        carregarMais();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> carregarDados() async {
    try {
      paginaAtual = 1;
      revisoes.clear();

      final response =
          await _service.getEvidencias(widget.id, paginaAtual, pageSize);

      setState(() {
        revisoes = response;
        isLoading = false;
        hasMore = response.length == pageSize;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  Future<void> carregarMais() async {
    setState(() {
      isLoadingMore = true;
    });

    paginaAtual++;

    try {
      final response =
          await _service.getEvidencias(widget.id, paginaAtual, pageSize);
      
      setState(() {
        revisoes.addAll(response);
        hasMore = response.length == pageSize;
        isLoadingMore = false;
      });
    } catch (e) {
      setState(() {
        isLoadingMore = false;
      });
    }
  }

  Future<void> _excluirEvidencia(int id) async {
    try {
      final statusCode = await _service.deleteEvidencia(id);

      if (statusCode == 200 || statusCode == 204) {
        setState(() {
          revisoes.removeWhere((e) => e.evidenciaRotaId == id);
        });

        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Evidência excluída com sucesso!")),
        );
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Erro: $e")),
      );
    }
  }

  Future<void> _abrirCriarEvidencia() async {
    final result = await Navigator.pushNamed(
      context,
      "/criarEvidencia",
      arguments: widget.id,
    );

    if (result == true) {
      carregarDados();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent("Revisão"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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

      floatingActionButton: FloatingActionButton(
        onPressed: _abrirCriarEvidencia,
        backgroundColor: AppColors.lightGrey,
        child: const Icon(Icons.add, color: AppColors.secondary,),
      ),
    );
  }
}