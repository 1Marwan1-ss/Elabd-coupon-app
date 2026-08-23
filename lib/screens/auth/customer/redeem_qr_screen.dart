import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../theme/app_colors.dart';
import '../../../models/drink.dart';

class RedeemQrScreen extends StatelessWidget {
  final Drink drink;

  const RedeemQrScreen({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    final qrData = 'redeem:${drink.id}:placeholder-token';

    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.brown),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(drink.imagePath, width: 150, height: 150),
                const SizedBox(height: 8),
                Text(
                  drink.name,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: AppColors.brown,
                  ),
                ),
                const SizedBox(height: 32),

                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.rose.withValues(alpha: 0.25),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  child: QrImageView(
                    data: qrData,
                    size: 220,
                    backgroundColor: Colors.white,
                  ),
                ),

                const SizedBox(height: 24),
                const Text(
                  'Show this to the barista to redeem',
                  style: TextStyle(color: AppColors.muted),
                ),

                //test delete before launch
                const SizedBox(height: 24),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text(
                    'TEST: Simulate staff scan',
                    style: TextStyle(color: AppColors.muted),
                  ),
                ),
                //test delete before launch
              ],
            ),
          ),
        ),
      ),
    );
  }
}
