import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/widgets/AppBarComponent.dart';
import 'package:monitoramento/app/shared/widgets/ButtonDeploy.dart';
import 'package:monitoramento/app/shared/widgets/InputComponent.dart';
import 'package:monitoramento/core/features/data/fiscais/fiscais_service.dart';
import 'package:monitoramento/core/features/models/fiscais/update_fiscais_model.dart';
import 'package:monitoramento/core/features/viewmodel/fiscais/view_model_fiscais.dart';
import 'package:monitoramento/core/network/api_client.dart';

class Updateusers extends StatefulWidget {
  const Updateusers({super.key, required this.idUser});

  final String idUser;

  @override
  State<Updateusers> createState() => _UpdateusersState();
}

class _UpdateusersState extends State<Updateusers> {
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

  void _alterarFiscal() {
    final nome = nomeFiscalController.text.trim();
    final sobrenome = sobrenomeFiscalController.text.trim();
    final isAdmin = isChecked;

    UpdateFiscaisModel fiscal = UpdateFiscaisModel(
      userId: widget.idUser,
      nome: nome,
      sobreNome: sobrenome,
      isAdmin: isAdmin,
    );

    try {
      _fiscaisViewModel.updateFiscal(fiscal, context);
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
        "Alterar Fiscal",
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
                text: "Alterar",
                select: true,
                onPressed: () {
                  _alterarFiscal();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}