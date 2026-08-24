import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class CouponInputSheet extends StatefulWidget {
  const CouponInputSheet({super.key});

  @override
  State<CouponInputSheet> createState() => _CouponInputSheetState();
}

class _CouponInputSheetState extends State<CouponInputSheet> {
  final _controller = TextEditingController();
  String? _errorText;

  // Code validation
  static const List<String> _validTestCodes = [
    'ELABD-2026',
    'Drink5',
    'TEST123',
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final code = _controller.text.trim().toUpperCase();

    if (code.isEmpty) {
      setState(() => _errorText = 'Please enter a coupon code');
      return;
    }

    if (!_validTestCodes.contains(code)) {
      setState(
        () => _errorText = 'Invalid coupon code — please check and try again',
      );
      return;
    }
    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.fromLTRB(24, 20, 24, 24 + bottomInset),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.muted.withOpacity(0.4),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Enter Coupon Code',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.brown,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Find the code printed on your physical coupon card.',
            style: TextStyle(color: AppColors.muted, fontSize: 13),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _controller,
            autofocus: true,
            textCapitalization: TextCapitalization.characters,
            cursorColor: AppColors.rose,
            style: const TextStyle(
              letterSpacing: 2,
              fontWeight: FontWeight.w600,
              color: AppColors.brown,
            ),
            decoration: InputDecoration(
              hintText: 'ELABD-2026',
              prefixIcon: const Icon(
                Icons.confirmation_number_outlined,
                color: AppColors.rose,
              ),
              filled: true,
              fillColor: Colors.white,
              floatingLabelStyle: const TextStyle(color: AppColors.rose),
              errorText: _errorText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.rose, width: 2),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
              ),
            ),
            onSubmitted: (_) => _submit(),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.rose,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28),
                ),
              ),
              child: const Text(
                'Add Coupon',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
