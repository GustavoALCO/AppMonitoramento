import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';
import 'package:monitoramento/app/shared/widgets/AppbarComponent.dart';
import 'package:monitoramento/app/shared/widgets/ButtonLogin.dart';
import 'package:monitoramento/app/shared/widgets/InputComponent.dart';
import 'package:monitoramento/core/features/models/fiscais/login_fiscal_model.dart';
import 'package:monitoramento/core/features/viewmodel/fiscais/view_model_auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void login() async {
    final viewModel = context.read<ViewModelAuth>();

    final model = LoginFiscalModel(
      login: emailController.text.trim(),
      senha: passwordController.text.trim(),
    );

    final success = await viewModel.login(model);

    if (success == true) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Falha no login. Verifique suas credenciais.',
            style: TextStyle(color: AppColors.lightGrey),
          ),
          backgroundColor: AppColors.secondary,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarComponent("App de Fiscalização"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png', height: 190),
            const SizedBox(height: 12),
            InputComponent(label: 'Email', controller: emailController),
            const SizedBox(height: 12),
            InputComponent(
              label: 'Senha',
              obscureText: true,
              controller: passwordController,
            ),
            SizedBox(height: 24),
            ButtonLogin(onPressed: login),
          ],
        ),
      ),
    );
  }
}
