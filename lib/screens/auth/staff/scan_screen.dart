import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../theme/app_colors.dart';
import '../../../models/scanned_coupon.dart';
import 'verify_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool _handled = false; // prevents scanning the same code multiple times

  void _onDetect(BarcodeCapture capture) {
    if (_handled) return;
    final code = capture.barcodes.first.rawValue;
    if (code == null) return;

    setState(() => _handled = true);
    _goToVerify(valid: true);
  }

  // TEMPORARY
  void _goToVerify({required bool valid}) {
    final coupon = valid
        ? const ScannedCoupon(
            customerName: 'Ahmed Hassan',
            drinkName: 'Caramel Frappe',
            drinkImagePath: 'assets/images/drinks/caramel_frappe.png',
            remainingBefore: 3,
            totalDrinks: 5,
            isValid: true,
          )
        : const ScannedCoupon(
            customerName: '',
            drinkName: '',
            drinkImagePath: '',
            remainingBefore: 0,
            totalDrinks: 0,
            isValid: false,
          );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => VerifyScreen(coupon: coupon)),
    ).then((_) {
      setState(() => _handled = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Scan Coupon', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                MobileScanner(onDetect: _onDetect),
                Center(
                  child: Container(
                    width: 260,
                    height: 260,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.rose, width: 3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Container(
            color: Colors.black,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _goToVerify(valid: true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.rose,
                    ),
                    child: const Text('TEST: Simulate valid scan'),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _goToVerify(valid: false),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade700,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('TEST: Simulate invalid scan'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
