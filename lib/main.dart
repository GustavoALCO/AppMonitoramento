import 'package:flutter/material.dart';
import 'package:monitoramento/app/modules/Pages/Evidencias/EvidenciasPage.dart';
import 'package:monitoramento/app/modules/Pages/Home/HomePage.dart';
import 'package:monitoramento/app/modules/Pages/Login/LoginPage.dart';
import 'package:monitoramento/app/modules/Pages/Revisao/RevisaoPage.dart';
import 'package:monitoramento/app/modules/Pages/Rotas/RotaPage.dart';
import 'package:monitoramento/app/shared/dto/evidenciaDto.dart';
import 'package:monitoramento/app/shared/enums/enumEvidenciaMode.dart';
import 'package:monitoramento/core/features/viewmodel/fiscais/view_model_auth.dart';
import 'package:monitoramento/core/features/data/fiscais/fiscais_service.dart';
import 'package:monitoramento/core/network/api_client.dart';
import 'package:monitoramento/core/services/sync_service.dart';
import 'package:monitoramento/core/services/token_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final tokenService = TokenService();


  bool isAuthenticated = await tokenService.verifyJWT();
  SyncService.instance.start();
  
  runApp(MyApp(isAuthenticated: isAuthenticated));
}

class MyApp extends StatelessWidget {
  final bool isAuthenticated;

  const MyApp({super.key, required this.isAuthenticated});

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
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(232, 255, 252, 240),
        ),
        
        debugShowCheckedModeBanner: false,

        // Define rota inicial automaticamente
        initialRoute: isAuthenticated ? '/home' : '/login',

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

            return EvidenciasPage(
              mode: EvidenciaMode.criar,
              rotaId: id,
            );
          },

          '/alterarEvidencia': (context) {
            final model =
                ModalRoute.of(context)!.settings.arguments as EvidenciaCardDto;

            return EvidenciasPage(
              mode: EvidenciaMode.alterar,
              model: model,
              rotaId: model.id,
            );
          },
        },
      ),
    );
  }
}