import 'package:flutter/material.dart';
import 'package:monitoramento/app/modules/Pages/Rotas/RotaPage.dart';
import 'package:monitoramento/app/shared/widgets/AppbarComponent.dart';
import 'package:monitoramento/app/shared/widgets/NavigationButton.dart';
import 'package:monitoramento/core/features/data/rotas/rotas_service.dart';
import 'package:monitoramento/core/features/models/rotas/get_filters_rotas_model.dart';
import 'package:monitoramento/core/services/bd_rota_service.dart';
import 'package:monitoramento/core/network/api_client.dart';
import 'package:monitoramento/core/services/token_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late RotasService _rotasService;
  final TokenService _tokenService = TokenService();
  final BdRotaService _bdRotaService = BdRotaService();

  @override
  void initState() {
    super.initState();

    _rotasService = RotasService(ApiClient());

    _carregarRotas();
  }

  Future<void> _carregarRotas() async {
    try {
      if (await _bdRotaService.existeRotas()) {
        return;
      }
      GetFiltersRotasModel model = GetFiltersRotasModel(
        id: await _tokenService.getIdPayload() ?? 0,
        page: 1,
        size: 99,
      );

      final rotas = await _rotasService.getRotas(model);

      for (var rota in rotas) {
        await _bdRotaService.criarRotas(
          rota.id,
          rota.alimentador,
          rota.dataInicio,
          rota.nome,
        );
      }
    } catch (e) {
      debugPrint("Erro ao carregar rotas: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent("Homepage", true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            NavigationButton(
              label: "Visualizar Rotas",
              selected: true,
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                         RotaPage(title: "Rotas Existentes"),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
