import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/widgets/AppbarComponent.dart';
import 'package:monitoramento/app/shared/widgets/BottonAppBarComponent.dart';
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
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    super.initState();
    _service = EvidenciasService(ApiClient());
    carregarDados();
  }

  Future<void> carregarDados() async {
    try {
      final response = await _service.getEvidencias(widget.id, 1, 10);

      setState(() {
        revisoes = response;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
        isLoading = false;
      });
    }
  }

  /// 🔥 DELETE AGORA FICA AQUI
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
      } else {
        ScaffoldMessenger.of(
          // ignore: use_build_context_synchronously
          context,
        ).showSnackBar(SnackBar(content: Text("Erro. Status: $statusCode")));
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(
        // ignore: use_build_context_synchronously
        context,
      ).showSnackBar(SnackBar(content: Text("Erro: $e")));
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
              return const Center(child: Text("Nenhuma evidência encontrada"));
            }

            return ListRevisaoComponent(
              revisoes: revisoes,
              onDelete: _excluirEvidencia,
            );
          },
        ),
      ),
      bottomNavigationBar: Bottomappbarcomponent(
        rota: "/criarEvidencia",
        id: widget.id,
      ),
    );
  }
}
