import 'package:flutter/material.dart';
import '../utils/AppColors.dart';

class SideBarComponent extends StatelessWidget {
  final bool isAdmin;

  const SideBarComponent({super.key, required this.isAdmin});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 220,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [

          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColors.primary,
            ),
            child: Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 160,
              ),
            ),
          ),

          //Fiscais
          _buildSectionTitle(Icons.people, "Fiscais"),

          if(isAdmin)
          _buildListTile(
            context,
            Icons.list,
            "Listar Fiscais Offline",
            "/createUsers",
          ),

          _buildListTile(
            context,
            Icons.person_add,
            "Cadastrar Fiscal",
            "/createUsers",
          ),

          const Divider(),

          // 🔹 SEÇÃO SISTEMA
          _buildSectionTitle(Icons.settings, "Sistema"),

          _buildListTile(
            context,
            Icons.settings,
            "Configurações",
            "/configuracoes",
          ),

          _buildListTile(
            context,
            Icons.logout,
            "Sair",
            "/login",
            isLogout: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(
    BuildContext context,
    IconData icon,
    String title,
    String route, {
    bool isLogout = false,
  }) {
    return ListTile(
      leading: Icon(icon, size: 20),
      title: Text(title, style: const TextStyle(fontSize: 14)),
      onTap: () {
        Navigator.pop(context);

        if (isLogout) {
          Navigator.pushReplacementNamed(context, route);
        } else {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }
}