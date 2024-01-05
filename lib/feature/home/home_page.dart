import 'package:bloc_auth/design/theme/app_color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text('Home Page',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.white,
                )),
      ),
    );
  }
}
