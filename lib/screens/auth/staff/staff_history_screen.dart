import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../theme/app_colors.dart';
import '../../../models/redemption.dart';

class StaffHistoryScreen extends StatelessWidget {
  final List<Redemption> redemptions;

  const StaffHistoryScreen({super.key, required this.redemptions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.cream,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.brown),
        title: const Text(
          'Session History',
          style: TextStyle(color: AppColors.brown, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: redemptions.isEmpty
            ? const Center(
                child: Text(
                  'No redemptions confirmed yet',
                  style: TextStyle(color: AppColors.muted),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: redemptions.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final r = redemptions[index];
                  return Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.brown.withOpacity(0.15)),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            r.drink.imagePath,
                            width: 48,
                            height: 48,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                r.drink.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.brown,
                                ),
                              ),
                              if (r.customerName != null)
                                Text(
                                  r.customerName!,
                                  style: const TextStyle(color: AppColors.muted, fontSize: 12),
                                ),
                              Text(
                                DateFormat('h:mm a').format(r.redeemedAt),
                                style: const TextStyle(color: AppColors.muted, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        const Icon(Icons.check_circle, color: AppColors.brown, size: 20),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}