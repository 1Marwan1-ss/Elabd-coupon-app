import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/role_switch.dart';

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
                    debugPrint('Logging in as $_selectedRole');
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
                      // TODO: navigate to a RegisterScreen once it exists
                      debugPrint('Go to register');
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
