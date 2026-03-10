import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';

class Buttondeploy extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool select;
  final bool iconEnabled;

  const Buttondeploy({
    this.onPressed,
    required this.text,
    required this.select,
    required this.iconEnabled,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 6,
        shadowColor: Colors.black,
        backgroundColor:
            select ? AppColors.secondary : AppColors.cards,
        foregroundColor:
            select ? AppColors.cards : AppColors.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        minimumSize: const Size(double.infinity, 48),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconEnabled) ...[
            Icon(
              select
                  ? Icons.camera_alt
                  : Icons.camera_alt_outlined,
              size: 20,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}