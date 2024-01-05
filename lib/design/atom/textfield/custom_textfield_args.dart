import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFieldArgs {
  CustomTextFieldArgs({
    required this.controller,
    required this.validator,
    this.onChanged,
    this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.errorStyle,
    this.onFieldSubmitted,
    this.isPassword = false,
    this.contentPadding = const EdgeInsets.all(15),
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.hintText,
    this.hintStyle,
    this.borderRadius = 8,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.readOnly = false,
    this.attachments,
    this.noBorder = false,
    this.counterText,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
  });

  final TextEditingController controller;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final TextCapitalization textCapitalization;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry contentPadding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextStyle? errorStyle;
  List<TextInputFormatter>? inputFormatters;
  final String? hintText;
  final TextStyle? hintStyle;
  final double borderRadius;
  final int? maxLength;
  final bool readOnly;
  final int? maxLines;
  final int? minLines;
  final List<Widget>? attachments;
  final bool noBorder;
  final String? counterText;
  final AutovalidateMode autoValidateMode;
}
