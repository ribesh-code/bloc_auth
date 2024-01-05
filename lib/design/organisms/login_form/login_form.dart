import 'package:bloc_auth/design/atom/button/custom_button.dart';
import 'package:bloc_auth/design/atom/button/custom_button_args.dart';
import 'package:bloc_auth/design/molecules/labeled_textfield/labeled_textfield.dart';
import 'package:bloc_auth/design/molecules/labeled_textfield/labeled_textfield_args.dart';
import 'package:bloc_auth/design/organisms/login_form/login_form_args.dart';
import 'package:bloc_auth/design/theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    required this.loginFormArgs,
    super.key,
  });

  final LoginFormArgs loginFormArgs;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _formDirty = false;
  // String? validateLoginID(String? value) {
  //   try {
  //     AuthCredential(loginID: value!, password: '', storeCode: '')
  //         .validateLoginID(context);
  //   } on AuthCredentialError catch (e) {
  //     return e.message;
  //   }
  //   return null;
  // }

  // String? validatePassword(String? value) {
  //   try {
  //     AuthCredential(loginID: '', password: value!, storeCode: '')
  //         .validatePassword(context);
  //   } on AuthCredentialError catch (e) {
  //     return e.message;
  //   }
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    final args = widget.loginFormArgs;
    final errorStyle = Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: 14,
          color: AppColors.errorColor,
          fontWeight: FontWeight.w400,
          height: 1,
        );
    final labelTextStyle = Theme.of(context).textTheme.titleSmall!.copyWith(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          height: 1.57,
        );
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Form(
            key: args.formKey,
            child: Column(
              children: [
                LabeledTextField(
                  labeledTextFieldArgs: LabeledTextFieldArgs(
                    label: 'Username',
                    labelTextStyle: labelTextStyle,
                    keyboardType: TextInputType.number,
                    controller: args.userNameController,
                    errorStyle: errorStyle,
                    autovalidateMode: _formDirty
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    //validator: validateStoreCode,
                    //inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(height: 16),
                LabeledTextField(
                  labeledTextFieldArgs: LabeledTextFieldArgs(
                    label: 'Password',
                    labelTextStyle: labelTextStyle,
                    keyboardType: TextInputType.number,
                    controller: args.passwordController,
                    isPassword: true,
                    errorStyle: errorStyle,
                    autovalidateMode: _formDirty
                        ? AutovalidateMode.always
                        : AutovalidateMode.disabled,
                    //validator: validatePassword,
                    // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
                const SizedBox(height: 32),
                CustomButton(
                  customButtonArgs: CustomButtonArgs(
                    label: 'Login',
                    onPressed: args.isLoading
                        ? () {}
                        : () {
                            setState(() {
                              _formDirty = true;
                            });
                            args.onLoginPress();
                          },
                    isLoading: args.isLoading,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
