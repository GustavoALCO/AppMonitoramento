import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/enums/enumConc.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';
import 'package:monitoramento/app/shared/widgets/AppBarComponent.dart';
import 'package:monitoramento/app/shared/widgets/ButtonDeploy.dart';
import 'package:monitoramento/app/shared/widgets/InputComponent.dart';
import 'package:monitoramento/app/shared/widgets/SelectBoxComponent.dart';
import 'package:monitoramento/core/features/data/fiscais/fiscais_service.dart';
import 'package:monitoramento/core/features/data/rotas/rotas_service.dart';
import 'package:monitoramento/core/features/models/fiscais/fiscais_model.dart';
import 'package:monitoramento/core/features/models/rotas/create_rotas_model.dart';
import 'package:monitoramento/core/features/viewmodel/fiscais/view_model_fiscais.dart';
import 'package:monitoramento/core/features/viewmodel/rotas/view_model_rotas.dart';
import 'package:monitoramento/core/network/api_client.dart';
import 'package:monitoramento/core/services/token_service.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:uuid/uuid.dart';

class Createrotas extends StatefulWidget {
  const Createrotas({super.key});

  @override
  State<Createrotas> createState() => _CreaterotasState();
}

class _CreaterotasState extends State<Createrotas> {
  late FiscaisService _fiscaisService;
  late ViewModelFiscais _serviceFiscais;
  late ViewModelRotas _rotasService;

  final uuid = Uuid();
  final TextEditingController nomeRotaController = TextEditingController();
  final TextEditingController alimentadorController = TextEditingController();
  final TokenService jwt = TokenService();

  late Conc concessionaria;

  List<FiscaisModel> usuarios = [];
  List<int> usuariosSelecionados = [];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    concessionaria = Conc.values.first;

    _fiscaisService = FiscaisService(ApiClient());
    _serviceFiscais = ViewModelFiscais(serviceFiscais: _fiscaisService);
    _rotasService = ViewModelRotas(rotasService: RotasService(ApiClient()));

    _carregarUsuarios();
  }

  Future<void> _carregarUsuarios() async {
    try {
      final data = await _serviceFiscais.loadFiscais();

      setState(() {
        usuarios = data;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    nomeRotaController.dispose();
    alimentadorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent("Criar Rotas", false),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputComponent(
                    label: "Nome da Rota",
                    controller: nomeRotaController,
                  ),

                  const SizedBox(height: 16),

                  InputComponent(
                    label: "Nome do Alimentador Principal",
                    controller: alimentadorController,
                  ),

                  const SizedBox(height: 16),

                  Selectboxcomponent<Conc>(
                    label: "Distribuidora",
                    value: concessionaria,
                    values: Conc.values,
                    labelBuilder: (value) => value.name,
                    onChanged: (value) {
                      setState(() {
                        concessionaria = value!;
                      });
                    },
                  ),

                  const SizedBox(height: 16),

                  MultiSelectDialogField<int>(
                    checkColor: AppColors.primary,
                    selectedColor: AppColors.secondary,

                    items: usuarios
                        .map((e) => MultiSelectItem<int>(e.userId, e.name))
                        .toList(),

                    title: const Text(
                      "Selecionar Fiscais",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    buttonText: const Text(
                      "Escolher usuários",
                      style: TextStyle(
                        color: AppColors.secondary,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppColors.secondary,
                        width: 1.2,
                      ),
                    ),

                    dialogHeight: 400,

                    onConfirm: (values) {
                      setState(() {
                        usuariosSelecionados = values;
                      });
                    },
                  ),

                  const SizedBox(height: 30),

                  Buttondeploy(
                    text: "Salvar Rota", 
                    iconEnabled: false, 
                    select: true, 
                    onPressed: () 
                    {
                      _salvarRota();
                    }
                  ),
                ],
              ),
            ),
          )
    );
  }

  void _salvarRota() {
    final nomeRota = nomeRotaController.text;
    final alimentador = alimentadorController.text;

    if (nomeRota.isEmpty || alimentador.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Preencha todos os campos")));
      return;
    }

    if (usuariosSelecionados.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Selecione pelo menos um fiscal")),
      );
      return;
    }

    try {

      _rotasService.createRota(
        CreateRotasModel(
          idRota: uuid.v4(),
          nome: nomeRota,
          alimentador: alimentador,
          idFiscal: usuariosSelecionados,
          dataInicio: DateTime.now(),
          conc: concessionaria.index,
        ),
      );

      Navigator.popAndPushNamed(
        context,
        "/rotas",
        arguments: jwt.getIdPayload(), 
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Erro ao salvar evidência")));
    }
  }
}
