import 'package:bloc_auth/design/theme/app_color.dart';
import 'package:bloc_auth/feature/auth/bloc/auth_bloc.dart';
import 'package:bloc_auth/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: BlocBuilder<AuthBloc, AuthState>(
          bloc: getItInstance<AuthBloc>(),
          builder: (context, state) {
            return Center(
              child: Text(
                state.user?.userName ?? '',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(),
              ),
            );
          },
        ));
  }
}
