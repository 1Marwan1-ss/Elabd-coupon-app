import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../widgets/role_switch.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //initiall state is user
  UserRole _selectedRole = UserRole.client;

  @override
  Widget build(BuildContext context) {
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
                decoration: InputDecoration(
                  labelText: _selectedRole == UserRole.client
                      ? 'Email or phone'
                      : 'Staff ID',
                  prefixIcon: const Icon(Icons.person_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
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
                    backgroundColor: _selectedRole == UserRole.client
                        ? AppColors.rose
                        : AppColors.brown,
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
            ],
          ),
        ),
      ),
    );
  }
}
