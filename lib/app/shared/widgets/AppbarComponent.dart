import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';


class AppbarComponent extends StatelessWidget
    implements PreferredSizeWidget {

  final String title;

  const AppbarComponent(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: const 
                  TextStyle(fontSize: 20.0, 
                            fontWeight: FontWeight.bold
                            )
                  ),
      centerTitle: true,
      backgroundColor: AppColors.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
