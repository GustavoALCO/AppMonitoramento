import 'package:flutter/material.dart';
import 'package:monitoramento/app/modules/Pages/CreateRotas/createRotas.dart';
import 'package:monitoramento/app/modules/Pages/Evidencias/EvidenciasPage.dart';
import 'package:monitoramento/app/modules/Pages/GenerateZip/GenerateZip.dart';
import 'package:monitoramento/app/modules/Pages/Home/HomePage.dart';
import 'package:monitoramento/app/modules/Pages/Login/LoginPage.dart';
import 'package:monitoramento/app/modules/Pages/Revisao/RevisaoPage.dart';
import 'package:monitoramento/app/modules/Pages/Rotas/RotaPage.dart';
import 'package:monitoramento/app/modules/Pages/SelectDocument/SelectDocument.dart';
import 'package:monitoramento/app/shared/dto/evidenciaDto.dart';
import 'package:monitoramento/app/shared/enums/enumDocument.dart';
import 'package:monitoramento/app/shared/enums/enumEvidenciaMode.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';
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
  useMaterial3: true,

  // 🔹 Fundo geral
  scaffoldBackgroundColor: AppColors.cards,

  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    primary: AppColors.secondary,
    surface: AppColors.cards,
  ),

  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(

      color: AppColors.secondary,
      fontWeight: FontWeight.w500,
    ),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.secondary),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.secondary),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: AppColors.secondary, width: 1),
    ),
  ),

  checkboxTheme: CheckboxThemeData(
  fillColor: WidgetStatePropertyAll(AppColors.secondary),
  checkColor: WidgetStatePropertyAll(Colors.white),
),

  // 🔹 Chips (MultiSelect usa)
  chipTheme: ChipThemeData(
    backgroundColor: AppColors.cards,
    selectedColor: AppColors.secondary,
    labelStyle: const TextStyle(color: Colors.black),
    secondaryLabelStyle: const TextStyle(color: Colors.white),
  ),

  // 🔹 Dialog (MultiSelect abre dialog)
  dialogTheme: DialogThemeData(
  backgroundColor: AppColors.cards,
),
),

        debugShowCheckedModeBanner: false,

        // Define rota inicial automaticamente
        initialRoute: isAuthenticated ? '/home' : '/login',

        routes: {
          '/login': (context) => LoginPage(),

          '/home': (context) => Homepage(),

          '/rotas': (context) => RotaPage(),

          '/criarRotas' : (context) => Createrotas(),

          '/revisao': (context) {
            final id = ModalRoute.of(context)!.settings.arguments as String;
            return Revisaopage(id: id);
          },

          '/selectDocument': (context) => Selectdocument(),

          '/criarEvidencia': (context) {
            final id = ModalRoute.of(context)!.settings.arguments as String;

            return EvidenciasPage(mode: EvidenciaMode.criar, rotaId: id);
          },

          '/alterarEvidencia': (context) {
            final model =
                ModalRoute.of(context)!.settings.arguments as EvidenciaCardDto;

            return EvidenciasPage(
              mode: EvidenciaMode.alterar,
              model: model,
              rotaId: model.rotaId,
            );
          },
          '/gerarZip': (context) {
            final mode = ModalRoute.of(context)!.settings.arguments as ZipMode;

            return GenerateZipPage(mode: mode);
          },
            
        },
      ),
    );
  }
}
