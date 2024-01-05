import 'package:flutter/material.dart';

class LoginFormArgs {
  const LoginFormArgs({
    required this.userNameController,
    required this.passwordController,
    required this.onLoginPress,
    required this.isLoading,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController userNameController;
  final TextEditingController passwordController;
  final VoidCallback onLoginPress;
  final bool isLoading;
}
