import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';
import 'package:monitoramento/app/shared/widgets/AppbarComponent.dart';
import 'package:monitoramento/app/shared/widgets/DialogFilterComponent.dart';
import 'package:monitoramento/app/shared/widgets/ListRotasComponent.dart';
import 'package:monitoramento/core/features/data/rotas/rotas_service.dart';
import 'package:monitoramento/core/features/models/rotas/get_filters_rotas_model.dart';
import 'package:monitoramento/core/features/models/rotas/rotas_model.dart';
import 'package:monitoramento/core/network/api_client.dart';
import 'package:monitoramento/core/services/bd_rota_service.dart';
import 'package:monitoramento/core/services/token_service.dart';

class RotaPage extends StatefulWidget {
  const RotaPage({super.key, this.title = "Rotas"});

  final String title;

  @override
  State<RotaPage> createState() => _RotaPageState();
}

class _RotaPageState extends State<RotaPage> {
  late RotasService _rotasService;
  late BdRotaService _bdRotaService;
  final TokenService _tokenService = TokenService();
  final ScrollController _scrollController = ScrollController();
  late int id;
  List<RotasModel> rotas = [];

  int paginaAtual = 1;
  final int pageSize = 5;

  bool isLoading = true;
  bool isLoadingMore = false;
  bool hasMore = true;

  String? error;

  @override
  void initState() {
    super.initState();

    _rotasService = RotasService(ApiClient());
    _bdRotaService = BdRotaService();

    adicionaValorId();

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

  Future<void> adicionaValorId() async {
    id = await _tokenService.getIdPayload() ?? 0;
    buscarRotas();
  }

  Future<void> buscarRotas() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    try {
      final filtro = GetFiltersRotasModel(
        id: id,
        page: paginaAtual,
        size: pageSize,
      );

      final resultadoApi = await _rotasService.getRotas(filtro);

      //verifica se o valor do resultado é maior que 0
      bool atingiuLimite  = resultadoApi.length / 2 > 0;

      /// API trouxe dados
      if (resultadoApi.isNotEmpty | atingiuLimite) {
        setState(() {
          rotas = resultadoApi;
          hasMore = resultadoApi.length == pageSize;
          isLoading = false;
        });

        return;
      }
    } catch (_) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Erro ao buscar mais rotas. ",
            style: const TextStyle(color: AppColors.cards),
          ),
          backgroundColor: AppColors.secondary,
        ),
      );
    }

    final resultadoLocal = await _bdRotaService.buscarRotas(
      paginaAtual,
      pageSize,
    );

    setState(() {
      rotas = resultadoLocal
          .map(
            (r) => RotasModel(
              id: r.idRota,
              alimentador: r.alimentador,
              nome: r.nomeRota,
              dataInicio: r.dataInicio,
            ),
          )
          .toList();

      hasMore = resultadoLocal.length == pageSize;
      isLoading = false;
    });
  }

  Future<void> carregarMais() async {
    if (isLoadingMore || !hasMore) return;

    setState(() {
      isLoadingMore = true;
    });

    final proximaPagina = paginaAtual + 1;

    try {
      final filtro = GetFiltersRotasModel(
        id: id,
        page: proximaPagina,
        size: pageSize,
      );

      final resultado = await _rotasService.getRotas(filtro);

      //verifica se o valor do resultado é maior que 0
      bool atingiuLimite  = resultado.length / 2 > 0;

      //Mostra evidencias do banco local caso o resultado de evidencias for nulo ou true
      if (resultado.isEmpty | atingiuLimite) {
        final local = await _bdRotaService.buscarRotas(proximaPagina, pageSize);

        if (local.isEmpty) {
          setState(() {
            hasMore = false;
            isLoadingMore = false;
          });
          return;
        }

        setState(() {
          paginaAtual = proximaPagina;
          rotas.addAll(
            local.map(
              (r) => RotasModel(
                id: r.idRota,
                alimentador: r.alimentador,
                nome: r.nomeRota,
                dataInicio: r.dataInicio,
              ),
            ),
          );
          hasMore = local.length == pageSize;
          isLoadingMore = false;
        });

        return;
      }

      setState(() {
        paginaAtual = proximaPagina;
        rotas.addAll(resultado);
        hasMore = resultado.length == pageSize;
        isLoadingMore = false;
      });
    } catch (e) {
      final local = await _bdRotaService.buscarRotas(proximaPagina, pageSize);

      if (local.isEmpty) {
        setState(() {
          hasMore = false;
          isLoadingMore = false;
        });
        return;
      }

      setState(() {
        paginaAtual = proximaPagina;
        rotas.addAll(
          local.map(
            (r) => RotasModel(
              id: r.idRota,
              alimentador: r.alimentador,
              nome: r.nomeRota,
              dataInicio: r.dataInicio,
            ),
          ),
        );
        hasMore = local.length == pageSize;
        isLoadingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(widget.title, false),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.cards,
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
            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (error != null) {
      return Center(child: Text(error!));
    }

    if (rotas.isEmpty) {
      return const Center(child: Text("Nenhuma rota encontrada"));
    }

    return ListRotasComponent(
      rotas: rotas,
      controller: _scrollController,
      isLoadingMore: isLoadingMore,
    );
  }
}
