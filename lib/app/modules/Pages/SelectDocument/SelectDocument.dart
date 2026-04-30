import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/enums/enumDocument.dart';
import 'package:monitoramento/app/shared/widgets/AppbarComponent.dart';
import 'package:monitoramento/app/shared/widgets/CardDocument.dart';

class Selectdocument extends StatefulWidget {
  const Selectdocument({super.key});

  @override
  State<Selectdocument> createState() => _SelectdocumentState();
}

class _SelectdocumentState extends State<Selectdocument> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarComponent("Selecione o Tipo de Documento", false),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Carddocument(
              icon: Icons.folder_zip,
              label: "Gerar Relatório",
              selected: true,
              onTap: () {
                Navigator.of(context).popAndPushNamed(
                  "/gerarZip",
                  arguments: ZipMode.Relatorio,
                );
              },
            ),
            const SizedBox(width: 16),
            Carddocument(
              icon: Icons.warning_amber_rounded,
              label: "Gerar Ofício",
              selected: true,
              onTap: () {
                Navigator.of(context).popAndPushNamed(
                  "/gerarZip",
                  arguments: ZipMode.Oficio,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}