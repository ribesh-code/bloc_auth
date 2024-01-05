import 'package:bloc_auth/design/atom/button/custom_button.dart';
import 'package:bloc_auth/design/atom/button/custom_button_args.dart';

import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: CustomButton(
            customButtonArgs: CustomButtonArgs(
              label: 'Login',
              isLoading: isLoading,
              onPressed: () async {},
            ),
          ),
        ),
      ),
    );
  }
}
