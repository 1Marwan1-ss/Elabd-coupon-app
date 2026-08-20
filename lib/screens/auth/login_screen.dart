import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/role_switch.dart';
import 'customer/customer_home_screen.dart';
import 'staff/staff_home_screen.dart';
import '../../widgets/app_logo.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Initial role is client
  UserRole _selectedRole = UserRole.client;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final accent = _selectedRole == UserRole.client
        ? AppColors.rose
        : AppColors.brown;

    return Scaffold(
      backgroundColor: AppColors.cream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: AppLogo(size: 120)),
              const SizedBox(height: 16),
              const Text(
                "El'Abd Foods",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.brown,
                ),
              ),
              const SizedBox(height: 32),

              RoleSwitch(
                selected: _selectedRole,
                onChanged: (role) {
                  setState(() => _selectedRole = role);
                },
              ),
              const SizedBox(height: 32),

              TextField(
                cursorColor: accent,
                decoration: InputDecoration(
                  labelText: _selectedRole == UserRole.client
                      ? 'Email or phone'
                      : 'Staff ID',
                  prefixIcon: const Icon(Icons.person_outline),
                  floatingLabelStyle: TextStyle(color: accent),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: accent, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              TextField(
                obscureText: _obscurePassword,
                cursorColor: accent,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  floatingLabelStyle: TextStyle(color: accent),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: accent, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    final destination = _selectedRole == UserRole.client
                        ? const CustomerHomeScreen()
                        : const StaffHomeScreen();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => destination),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: accent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28),
                    ),
                  ),
                  child: Text(
                    _selectedRole == UserRole.client
                        ? 'Log In'
                        : 'Log In as Staff',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "New here? ",
                    style: TextStyle(color: AppColors.muted),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Create an account',
                      style: TextStyle(
                        color: accent,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
