import 'package:flutter/material.dart';
import 'package:monitoramento/app/modules/Pages/Evidencias/EvidenciasPage.dart';
import 'package:monitoramento/app/modules/Pages/Home/HomePage.dart';
import 'package:monitoramento/app/modules/Pages/Login/LoginPage.dart';
import 'package:monitoramento/app/modules/Pages/Revisao/RevisaoPage.dart';
import 'package:monitoramento/app/modules/Pages/Rotas/RotaPage.dart';
import 'package:monitoramento/app/shared/enums/enumEvidenciaMode.dart';
import 'package:monitoramento/core/features/models/evidencias/evidencias_model.dart';
import 'package:monitoramento/core/features/viewmodel/fiscais/view_model_auth.dart';
import 'package:provider/provider.dart';
import 'package:monitoramento/core/features/data/fiscais/fiscais_service.dart';
import 'package:monitoramento/core/network/api_client.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              ViewModelAuth(serviceFiscais: FiscaisService(ApiClient())),
        ),
      ],
      child: MaterialApp(
        title: 'Aplicativo para Fiscalização de Campo',
        initialRoute: '/login',
        routes: {
          '/login': (context) => LoginPage(),
          '/home': (context) => Homepage(),
          '/rotas': (context) => RotaPage(),
          '/revisao': (context) {
            final id = ModalRoute.of(context)!.settings.arguments as int;
            return Revisaopage(id: id);
          },
          '/criarEvidencia': (context) {
            final id = ModalRoute.of(context)!.settings.arguments as int;

            return EvidenciasPage(mode: EvidenciaMode.criar, id: id);
          },
          '/alterarEvidencia': (context) {
            final model =
                ModalRoute.of(context)!.settings.arguments as EvidenciaModel;
                

            return EvidenciasPage(mode: EvidenciaMode.alterar, model: model, id: model.evidenciaRotaId,);
          },
        },
      ),
    );
  }
}
