import 'package:bloc_auth/core/enum/button_type.dart';
import 'package:bloc_auth/design/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomButtonArgs {
  const CustomButtonArgs({
    required this.label,
    required this.onPressed,
    this.type = ButtonType.medium,
    this.filled = true,
    this.isLoading = false,
    this.prefixIconPath,
    this.filledColor = AppColors.primaryColor,
    this.btnTextColor = Colors.white,
    this.prefixIconHeight = 16.0,
    this.prefixIconWidth = 16.0,
    this.icon,
    this.size = 16,
  });

  final ButtonType type;
  final bool filled;
  final bool isLoading;
  final VoidCallback? onPressed;
  final String label;
  final String? prefixIconPath;
  final Color filledColor;
  final Color btnTextColor;
  final double prefixIconHeight;
  final double prefixIconWidth;
  final IconData? icon;
  final double size;
}
