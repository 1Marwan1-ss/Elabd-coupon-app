import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../models/drink.dart';

class DrinkCard extends StatelessWidget {
  final Drink drink;
  final bool enabled;
  final VoidCallback onTap;

  const DrinkCard({
    super.key,
    required this.drink,
    required this.enabled,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 250),
        opacity: enabled ? 1.0 : 0.4,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.rose.withValues(alpha: 0.3)),
            boxShadow: [
              BoxShadow(
                color: AppColors.rose.withValues(alpha: 0.15),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(drink.imagePath, width: 90, height: 90),
              const SizedBox(height: 10),
              Text(
                drink.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.brown,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
