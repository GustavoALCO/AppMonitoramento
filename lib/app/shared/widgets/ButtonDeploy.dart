import 'package:flutter/material.dart';
import 'package:monitoramento/app/shared/utils/AppColors.dart';

class Buttondeploy extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool select;
  final bool iconEnabled;
  final double? padding;

  const Buttondeploy({
    this.onPressed,
    required this.text,
    required this.select,
    required this.iconEnabled,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 6,
        shadowColor: Colors.black,
        backgroundColor:
            select ? AppColors.primary : AppColors.secondary,
        foregroundColor:
            select ? AppColors.secondary : AppColors.cards,
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
    )
    );
  }
}