import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';
import 'package:monitoramento/core/services/token_service.dart';

class AppbarComponent extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool logoff;

  final TokenService _tokenService = TokenService();

  AppbarComponent(this.title, this.logoff, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      automaticallyImplyLeading: false,

      leading: Builder(
        builder: (context) => IconButton(
          icon: const Icon(Icons.menu, color: AppColors.cards),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
      ),

      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: AppColors.cards
        ),
      ),

      actions: [
        if (logoff)
          IconButton(
            icon: const Icon(Icons.logout, color: AppColors.cards),
            onPressed: () {
              _tokenService.deleteToken();
              Navigator.pushReplacementNamed(context, "/login");
            },
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}