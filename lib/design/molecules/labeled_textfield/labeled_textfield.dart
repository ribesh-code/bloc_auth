import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabeledTextFieldArgs {
  const LabeledTextFieldArgs({
    required this.label,
    required this.labelTextStyle,
    required this.controller,
    required this.keyboardType,
    this.isPassword = false,
    this.focusNode,
    this.errorStyle,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.contentPadding = const EdgeInsets.all(15),
    this.maxLine = 1,
    this.maxLength,
    this.readOnly = false,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final FormFieldValidator<String>? validator;
  final FocusNode? focusNode;
  final TextStyle? errorStyle;
  final TextStyle labelTextStyle;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry contentPadding;
  final int maxLine;
  final int? maxLength;
  final bool readOnly;
  final AutovalidateMode autovalidateMode;
}
