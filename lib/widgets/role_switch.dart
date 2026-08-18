//reusable widget
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

enum UserRole { client, staff } //Fixed variables 2 options bs

class RoleSwitch extends StatelessWidget {
  final UserRole selected; //Which user role is selcted
  final ValueChanged<UserRole> onChanged; // onchange a call back function role switch --> login screen ---> change role

  const RoleSwitch({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.rose.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Row(
        //row bt7ot el 7aga horizontally
        children: [
          _buildTab(label: 'Client', role: UserRole.client),
          _buildTab(label: 'Staff', role: UserRole.staff),
        ],
      ),
    );
  }

  Widget _buildTab({required String label, required UserRole role}) {
    // (_) Private method
    final active = selected == role;
    return Expanded(
      child: GestureDetector(
        onTap: () => onChanged(role),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: active
                ? (role == UserRole.client ? AppColors.rose : AppColors.brown)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: active ? Colors.white : AppColors.muted,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
