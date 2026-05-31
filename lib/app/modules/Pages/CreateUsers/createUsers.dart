import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/widgets/AppBarComponent.dart';
import 'package:monitoramento/app/shared/widgets/ButtonDeploy.dart';
import 'package:monitoramento/app/shared/widgets/InputComponent.dart';
import 'package:monitoramento/core/features/data/fiscais/fiscais_service.dart';
import 'package:monitoramento/core/features/models/fiscais/create_fiscal_model.dart';
import 'package:monitoramento/core/features/viewmodel/fiscais/view_model_fiscais.dart';
import 'package:monitoramento/core/network/api_client.dart';

class Createusers extends StatefulWidget {
  const Createusers({super.key});

  @override
  State<Createusers> createState() => _CreateusersState();
}

class _CreateusersState extends State<Createusers> {
  bool isChecked = false;

  late ApiClient _apiClient;
  late FiscaisService _fiscaisService;
  late ViewModelFiscais _fiscaisViewModel;

  final TextEditingController nomeFiscalController =
      TextEditingController();

  final TextEditingController sobrenomeFiscalController =
      TextEditingController();

  final TextEditingController senhaFiscalController =
      TextEditingController();

  @override
  void initState() {
    super.initState();

    _apiClient = ApiClient();
    _fiscaisService = FiscaisService(_apiClient);

    _fiscaisViewModel = ViewModelFiscais(
      serviceFiscais: _fiscaisService,
    );
  }

  @override
  void dispose() {
    nomeFiscalController.dispose();
    sobrenomeFiscalController.dispose();
    senhaFiscalController.dispose();

    super.dispose();
  }

  void _adicionarFiscal() {
    final nome = nomeFiscalController.text.trim();
    final sobrenome = sobrenomeFiscalController.text.trim();
    final senha = senhaFiscalController.text.trim();
    final isAdmin = isChecked;

    if (nome.isEmpty || sobrenome.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Preencha todos os campos"),
        ),
      );
      return;
    }

    CreateFiscalModel fiscal = CreateFiscalModel(
      name: nome,
      sobrenome: sobrenome,
      senha: senha,
      isAdmin: isAdmin,
    );

    try {
      _fiscaisViewModel.createFiscal(fiscal, context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Erro ao salvar fiscal"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent(
        "Cadastrar Fiscal",
        false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InputComponent(
                label: "Nome",
                controller: nomeFiscalController,
              ),

              const SizedBox(height: 12),

              InputComponent(
                label: "Sobrenome",
                controller: sobrenomeFiscalController,
              ),

              const SizedBox(height: 12),

              InputComponent(
                label: "Senha",
                controller: senhaFiscalController,
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),

                  const Text("Administrador"),

                  const SizedBox(width: 8),
                ],
              ),

              const SizedBox(height: 20),

              Buttondeploy(
                iconEnabled: false,
                text: "Cadastrar",
                select: true,
                onPressed: () {
                  _adicionarFiscal();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}