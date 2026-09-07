import 'package:flutter/material.dart';

import 'screens/auth/login_screen.dart';

void main() {
  runApp(const ElAbdCouponApp());
}

class ElAbdCouponApp extends StatelessWidget {
  const ElAbdCouponApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'El Abd Coupon App',
      home: const LoginScreen(),
    );
  }
}
