import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/app_logo.dart';

class StaffHomeScreen extends StatelessWidget {
  const StaffHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: const [
            AppLogo(size: 56),
            SizedBox(width: 10),
            Text(
              "El'Abd Foods — Staff",
              style: TextStyle(
                color: AppColors.brown,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      body: const Center(child: Text('QR scanner screen goes here')),
    );
  }
}
