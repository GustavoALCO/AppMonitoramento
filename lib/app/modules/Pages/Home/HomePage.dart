import 'package:flutter/material.dart';
import 'package:monitoramento/app/modules/Pages/Rotas/RotaPage.dart';
import 'package:monitoramento/app/shared/widgets/AppbarComponent.dart';
import 'package:monitoramento/app/shared/widgets/NavigationButton.dart';
class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
                        const RotaPage(title: "Rotas Existentes"),
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
