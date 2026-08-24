import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';
import '../../../widgets/app_logo.dart';
import '../../../widgets/drink_card.dart';
import '../../../data/sample_drinks.dart';
import '../../../models/drink.dart';
import '../../../models/redemption.dart';
import 'redeem_qr_screen.dart';
import 'history_screen.dart';
import '../../../widgets/coupon_input.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _remaining = 0;
  int _total = 0;
  final List<Redemption> _redemptions = [];

  static const String _placeholderBranch = 'Zayed Branch';
  static const int _drinksPerCoupon = 5;

  bool get _hasCoupon => _total > 0;
  bool get _hasDrinksLeft => _remaining > 0;

  void _addCoupon() async {
    final added = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const CouponInputSheet(),
    );

    if (added == true) {
      setState(() {
        _total += _drinksPerCoupon;
        _remaining += _drinksPerCoupon;
      });
    }
  }

  void _redeem(Drink drink) async {
    final scanned = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => RedeemQrScreen(drink: drink)),
    );
    // History simulation
    if (scanned == true) {
      setState(() {
        _remaining--;
        _redemptions.insert(
          0,
          Redemption(
            drink: drink,
            redeemedAt: DateTime.now(),
            branch: _placeholderBranch,
          ),
        );
      });
    }
  }

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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HistoryScreen(redemptions: _redemptions),
                ),
              );
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
              // Add Coupon Button
              Center(
                child: Column(
                  children: [
                    if (_hasCoupon) ...[
                      Text(
                        '$_remaining/$_total',
                        style: TextStyle(
                          fontSize: 56,
                          fontWeight: FontWeight.bold,
                          color: _hasDrinksLeft
                              ? AppColors.rose
                              : AppColors.muted,
                        ),
                      ),
                      Text(
                        _hasDrinksLeft
                            ? 'Drinks remaining'
                            : 'No drinks remaining',
                        style: const TextStyle(
                          color: AppColors.muted,
                          fontSize: 13,
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                    SizedBox(
                      width: 200,
                      height: 46,
                      child: ElevatedButton.icon(
                        onPressed: _addCoupon,
                        icon: const Icon(Icons.add, size: 18),
                        label: Text(
                          _hasCoupon ? 'Add Another Coupon' : 'Add Coupon',
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _hasCoupon
                              ? AppColors.brown
                              : AppColors.rose,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
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
                    childAspectRatio: 1.0,
                  ),
                  itemBuilder: (context, index) {
                    final drink = sampleDrinks[index];
                    return DrinkCard(
                      drink: drink,
                      enabled: _hasDrinksLeft,
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
