import 'package:bloc_auth/design/atom/textfield/custom_textfield.dart';
import 'package:bloc_auth/design/atom/textfield/custom_textfield_args.dart';
import 'package:bloc_auth/design/molecules/labeled_textfield/labeled_textfield.dart';
import 'package:flutter/material.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    required this.labeledTextFieldArgs,
    super.key,
  });
  final LabeledTextFieldArgs labeledTextFieldArgs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Text(
            labeledTextFieldArgs.label,
            style: labeledTextFieldArgs.labelTextStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 8),
        CustomTextField(
          customTextFieldArgs: CustomTextFieldArgs(
            controller: labeledTextFieldArgs.controller,
            keyboardType: labeledTextFieldArgs.keyboardType,
            isPassword: labeledTextFieldArgs.isPassword,
            validator: labeledTextFieldArgs.validator,
            focusNode: labeledTextFieldArgs.focusNode,
            errorStyle: labeledTextFieldArgs.errorStyle,
            inputFormatters: labeledTextFieldArgs.inputFormatters,
            onChanged: labeledTextFieldArgs.onChanged,
            contentPadding: labeledTextFieldArgs.contentPadding,
            maxLines: labeledTextFieldArgs.maxLine,
            maxLength: labeledTextFieldArgs.maxLength,
            readOnly: labeledTextFieldArgs.readOnly,
            autoValidateMode: labeledTextFieldArgs.autovalidateMode,
          ),
        ),
      ],
    );
  }
}
