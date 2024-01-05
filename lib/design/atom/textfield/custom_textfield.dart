import 'package:bloc_auth/design/atom/textfield/custom_textfield_args.dart';
import 'package:bloc_auth/design/theme/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.customTextFieldArgs,
    super.key,
  });

  final CustomTextFieldArgs customTextFieldArgs;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    final textFieldArgs = widget.customTextFieldArgs;

    var finalSuffixIcon = textFieldArgs.suffixIcon;

    if (textFieldArgs.isPassword) {
      finalSuffixIcon = IconButton(
        icon: Icon(
          _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          color: AppColors.grayColor2,
        ),
        onPressed: () {
          setState(() {
            _isPasswordVisible = !_isPasswordVisible;
          });
        },
      );
    }

    return TextFormField(
      readOnly: textFieldArgs.readOnly,
      maxLength: textFieldArgs.maxLength,
      maxLines: textFieldArgs.maxLines,
      controller: textFieldArgs.controller,
      keyboardType: textFieldArgs.keyboardType,
      textInputAction: textFieldArgs.textInputAction,
      textCapitalization: textFieldArgs.textCapitalization,
      obscureText: textFieldArgs.isPassword && !_isPasswordVisible,
      validator: textFieldArgs.validator,
      onChanged: textFieldArgs.onChanged,
      onFieldSubmitted: textFieldArgs.onFieldSubmitted,
      focusNode: textFieldArgs.focusNode,
      autovalidateMode: textFieldArgs.autoValidateMode,
      inputFormatters: textFieldArgs.inputFormatters,
      minLines: textFieldArgs.minLines,
      decoration: InputDecoration(
        counterText: textFieldArgs.counterText,
        hintText: textFieldArgs.hintText,
        hintStyle: textFieldArgs.hintStyle,
        filled: true,
        fillColor: Colors.transparent,
        errorStyle: textFieldArgs.errorStyle,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(textFieldArgs.borderRadius),
          borderSide: BorderSide(
            color: textFieldArgs.noBorder ? Colors.transparent : Colors.red,
          ),
          gapPadding: 0,
        ),
        contentPadding: textFieldArgs.contentPadding,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(textFieldArgs.borderRadius),
          borderSide: BorderSide(
            color: textFieldArgs.noBorder ? Colors.transparent : Colors.red,
          ),
          gapPadding: 0,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(textFieldArgs.borderRadius),
          borderSide: BorderSide(
            color: textFieldArgs.noBorder
                ? Colors.transparent
                : AppColors.grayColor2,
          ),
          gapPadding: 0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(textFieldArgs.borderRadius),
          borderSide: BorderSide(
            color: textFieldArgs.noBorder
                ? Colors.transparent
                : AppColors.primaryColor,
          ),
          gapPadding: 0,
        ),
        errorMaxLines: 3,
        prefixIcon: textFieldArgs.prefixIcon,
        suffixIcon: finalSuffixIcon,
        isDense: true,
      ),
    );
  }
}
