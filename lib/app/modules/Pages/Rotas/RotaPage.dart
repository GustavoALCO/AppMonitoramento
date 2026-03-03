import 'package:flutter/material.dart';

import 'package:monitoramento/app/shared/utils/AppColors.dart';
import 'package:monitoramento/app/shared/widgets/AppbarComponent.dart';
import 'package:monitoramento/app/shared/widgets/DialogFilterComponent.dart';
import 'package:monitoramento/app/shared/widgets/ListRotasComponent.dart';
import 'package:monitoramento/core/features/data/rotas/rotas_service.dart';
import 'package:monitoramento/core/features/models/rotas/get_filters_rotas_model.dart';
import 'package:monitoramento/core/features/models/rotas/rotas_model.dart';
import 'package:monitoramento/core/network/api_client.dart';

class RotaPage extends StatefulWidget {
  const RotaPage({
    super.key,
    this.title = "Rotas",
    this.id = 4,
  });

  final String title;
  final int id;

  @override
  State<RotaPage> createState() => _RotaPageState();
}

class _RotaPageState extends State<RotaPage> {
  late RotasService _rotasService ;

  bool isLoading = true;
  List<RotasModel> rotas = [];
  String? error;

  @override
  void initState() {
    super.initState();
    _rotasService = RotasService(ApiClient());
    buscarRotas();
  }

  Future<void> buscarRotas() async {
    try {
      setState(() {
        isLoading = true;
        error = null;
      });

      final filtro = GetFiltersRotasModel(
        id: widget.id,
        page: 1,
        size: 1,
      );

      final resultado = await _rotasService.getRotas(filtro);

      setState(() {
        rotas = resultado;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        error = "Erro ao carregar rotas";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(widget.title),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightGrey,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => const DialogFilterComponent(),
                  );
                },
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.article),
                    SizedBox(width: 8),
                    Text(
                      "Filtros",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: _buildContent(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (error != null) {
      return Center(
        child: Text(error!),
      );
    }

    if (rotas.isEmpty) {
      return const Center(
        child: Text("Nenhuma rota encontrada"),
      );
    }

    return ListRotasComponent(rotas: rotas);
  }
}