import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/app_logo.dart';
import '../../../widgets/drink_card.dart';
import '../../../data/sample_drinks.dart';
import '../../../models/drink.dart';
import 'redeem_qr_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  //replace with the real remaining count from the backend

  int _remaining = 5;
  final int _total = 5;

  void _redeem(Drink drink) async {
    final scanned = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => RedeemQrScreen(drink: drink)),
    );

    // TEMPORARY simulation
    if (scanned == true) {
      setState(() => _remaining--);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasDrinksLeft = _remaining > 0;

    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          children: const [
            AppLogo(size: 60),
            SizedBox(width: 10),
            Text(
              "El'Abd Foods",
              style: TextStyle(
                color: AppColors.brown,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.history, color: AppColors.brown),
            onPressed: () {
              // Navigate to a real HistoryScreen
              debugPrint('Open redemption history');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ---- Hero Counter ----
              Center(
                child: Column(
                  children: [
                    Text(
                      '$_remaining/$_total',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: hasDrinksLeft ? AppColors.rose : AppColors.muted,
                      ),
                    ),
                    Text(
                      hasDrinksLeft
                          ? 'Free drinks remaining'
                          : 'No free drinks remaining',
                      style: const TextStyle(
                        color: AppColors.muted,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // ---- Drink grid ----
              Expanded(
                child: GridView.builder(
                  itemCount: sampleDrinks.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    final drink = sampleDrinks[index];
                    return DrinkCard(
                      drink: drink,
                      enabled: hasDrinksLeft,
                      onTap: () => _redeem(drink),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
