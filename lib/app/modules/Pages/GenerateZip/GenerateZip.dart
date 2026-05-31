import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/enums/enumDocument.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';
import 'package:monitoramento/app/shared/widgets/AppBarComponent.dart';
import 'package:monitoramento/app/shared/widgets/ListRotasSelectableComponent.dart';
import 'package:monitoramento/core/features/data/rotas/rotas_service.dart';
import 'package:monitoramento/core/features/models/rotas/get_filters_rotas_model.dart';
import 'package:monitoramento/core/features/models/rotas/rotas_model.dart';
import 'package:monitoramento/core/features/viewmodel/rotas/zip_view_model.dart';
import 'package:monitoramento/core/network/api_client.dart';
import 'package:monitoramento/core/services/bd_rota_service.dart';
import 'package:monitoramento/core/services/token_service.dart';

class GenerateZipPage extends StatefulWidget {
  final ZipMode mode;
  const GenerateZipPage({super.key, required this.mode});

  @override
  State<GenerateZipPage> createState() => _GenerateZipPageState();
}

class _GenerateZipPageState extends State<GenerateZipPage> {
  late RotasService _rotasService;
  late BdRotaService _bdRotaService;
  late ZipViewModel _viewModelRotas;
  final TokenService _tokenService = TokenService();

  final ScrollController _scrollController = ScrollController();

  List<RotasModel> rotas = [];
  Set<String> selectedIds = {};

  int paginaAtual = 1;
  final int pageSize = 5;

  bool isLoading = true;
  bool isLoadingMore = false;
  bool hasMore = true;

  late int id;

  bool _dialogAberto = false;

  @override
  void initState() {
    super.initState();

    _rotasService = RotasService(ApiClient());
    _bdRotaService = BdRotaService();
    _viewModelRotas = ZipViewModel(service: _rotasService);

    _viewModelRotas.addListener(_listenerDownload);

    _init();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
              _scrollController.position.maxScrollExtent - 200 &&
          !isLoadingMore &&
          hasMore) {
        carregarMais();
      }
    });
  }

  Future<void> _init() async {
    id = await _tokenService.getIdPayload() ?? 0;
    await buscarRotas();
  }

  void _listenerDownload() {
    if (!mounted) return;

    // LOADING
    if (_viewModelRotas.isLoading) {
      if (!_dialogAberto) {
        _dialogAberto = true;

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => const Center(child: CircularProgressIndicator()),
        );
      }
      return;
    }

    // FECHAR LOADING
    if (_dialogAberto && Navigator.canPop(context)) {
      Navigator.pop(context);
      _dialogAberto = false;
    }

    // ERRO
    if (_viewModelRotas.errorMessage != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.error, color: Colors.red),
              const SizedBox(width: 10),
              Expanded(child: Text(_viewModelRotas.errorMessage!)),
            ],
          ),
        ),
      );
      return;
    }

    // SUCESSO
    if (_viewModelRotas.fileGerado != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: AppColors.primary),
              SizedBox(width: 10),
              Text("ZIP salvo na pasta Downloads"),
            ],
          ),
        ),
      );

      _viewModelRotas.clear();
    }
  }

  void gerarZip() {
    if (selectedIds.isEmpty) return;

    if (widget.mode == ZipMode.Oficio) {
      _viewModelRotas.baixarEmergencial(selectedIds.first);
    } else {
      _viewModelRotas.baixarRelatorio(selectedIds.toList());
    }
  }

  Future<void> buscarRotas() async {
    setState(() => isLoading = true);

    try {
      final filtro = GetFiltersRotasModel(
        id: id,
        page: paginaAtual,
        size: pageSize,
      );

      final resultado = await _rotasService.getRotas(filtro);

      setState(() {
        rotas = resultado;
        hasMore = resultado.length == pageSize;
        isLoading = false;
      });
    } catch (_) {
      final local = await _bdRotaService.buscarRotas(paginaAtual, pageSize);

      setState(() {
        rotas = local
            .map((r) => RotasModel(
                  id: r.idRota,
                  alimentador: r.alimentador,
                  nome: r.nomeRota,
                  dataInicio: r.dataInicio,
                  conc: r.conc,
                  km: r.km,
                ))
            .toList();

        hasMore = local.length == pageSize;
        isLoading = false;
      });
    }
  }

  Future<void> carregarMais() async {
    if (isLoadingMore || !hasMore) return;

    setState(() => isLoadingMore = true);

    final proximaPagina = paginaAtual + 1;

    try {
      final filtro = GetFiltersRotasModel(
        id: id,
        page: proximaPagina,
        size: pageSize,
      );

      final resultado = await _rotasService.getRotas(filtro);

      setState(() {
        paginaAtual = proximaPagina;
        rotas.addAll(resultado);
        hasMore = resultado.length == pageSize;
        isLoadingMore = false;
      });
    } catch (_) {
      final local =
          await _bdRotaService.buscarRotas(proximaPagina, pageSize);

      setState(() {
        paginaAtual = proximaPagina;
        rotas.addAll(local.map((r) => RotasModel(
              id: r.idRota,
              alimentador: r.alimentador,
              nome: r.nomeRota,
              dataInicio: r.dataInicio,
              conc: r.conc,
              km: r.km,
            )));

        hasMore = local.length == pageSize;
        isLoadingMore = false;
      });
    }
  }

  @override
  void dispose() {
    _viewModelRotas.removeListener(_listenerDownload);
    _scrollController.dispose();
    super.dispose();
  }

  //Pagina
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent("Gerar ZIP", false),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : rotas.isEmpty
                      ? const Center(child: Text("Nenhuma rota encontrada"))
                      : ListRotasSelectableComponent(
                          rotas: rotas,
                          controller: _scrollController,
                          isLoadingMore: isLoadingMore,
                          mode: widget.mode,
                          onSelectionChanged: (ids) {
                            setState(() {
                              selectedIds = ids;
                            });
                          },
                        ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed: selectedIds.isEmpty ? null : gerarZip,
              style: ElevatedButton.styleFrom(
                backgroundColor: selectedIds.isEmpty
                    ? Colors.grey
                    : AppColors.primary,
                foregroundColor: selectedIds.isEmpty
                    ? Colors.white
                    : AppColors.secondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.download),
                  const SizedBox(width: 8),
                  Text(
                    widget.mode == ZipMode.Oficio
                        ? "Baixar Ofício"
                        : "Baixar Relatório",
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}