import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../models/scanned_coupon.dart';

class VerifyScreen extends StatelessWidget {
  final ScannedCoupon coupon;

  const VerifyScreen({super.key, required this.coupon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.brown),
        title: const Text(
          'Verify Coupon',
          style: TextStyle(color: AppColors.brown, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: coupon.isValid ? _buildValid(context) : _buildInvalid(context),
        ),
      ),
    );
  }

  Widget _buildInvalid(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.cancel, color: Colors.red, size: 72),
        const SizedBox(height: 20),
        const Text(
          'Invalid or expired coupon',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.brown,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'This QR code could not be verified. Ask the customer to try again.',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.muted),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.brown),
            child: const Text(
              'Back to Scanner',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildValid(BuildContext context) {
    final remainingAfter = coupon.remainingBefore - 1;

    return Column(
      children: [
        const Icon(Icons.check_circle, color: AppColors.rose, size: 56),
        const SizedBox(height: 12),
        Text(
          coupon.customerName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.brown,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          '${coupon.remainingBefore}/${coupon.totalDrinks} drinks remaining',
          style: const TextStyle(color: AppColors.muted),
        ),
        const SizedBox(height: 28),

        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.rose.withValues(alpha: 0.3)),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  coupon.drinkImagePath,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Selected drink',
                      style: TextStyle(color: AppColors.muted, fontSize: 12),
                    ),
                    Text(
                      coupon.drinkName,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColors.brown,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        const Spacer(),

        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 52,
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.muted),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: AppColors.muted),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Redeemed! $remainingAfter/${coupon.totalDrinks} remaining.',
                        ),
                      ),
                    );
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.rose,
                  ),
                  child: const Text(
                    'Confirm',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
