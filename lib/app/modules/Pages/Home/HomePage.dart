import 'package:flutter/material.dart';
import 'package:monitoramento/app/modules/Pages/Rotas/RotaPage.dart';
import 'package:monitoramento/app/shared/widgets/AppbarComponent.dart';
import 'package:monitoramento/app/shared/widgets/NavigationButton.dart';
import 'package:monitoramento/core/services/token_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TokenService _tokenService = TokenService();

  @override
  void initState() {
    super.initState();

    _tokenService.verifyJWT();
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
                    builder: (context) => RotaPage(title: "Rotas Existentes"),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            NavigationButton(
              label: "Baixar Documentos",
              selected: false,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  "/selectDocument"
                  ,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
