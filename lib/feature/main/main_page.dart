import 'package:bloc_auth/design/theme/app_color.dart';
import 'package:bloc_auth/feature/auth/bloc/auth_bloc.dart';
import 'package:bloc_auth/feature/auth/page/login_page.dart';
import 'package:bloc_auth/feature/home/home_page.dart';
import 'package:bloc_auth/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = getItInstance<AuthBloc>();

    _authBloc.add(Initialize());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        bloc: _authBloc,
        listener: (context, state) {
          if (state.status == AuthStatus.authenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          } else if (state.status == AuthStatus.unauthenticated) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          }
        },
        child: const Center(
            child: CircularProgressIndicator(
          backgroundColor: AppColors.primaryColor,
          strokeWidth: 2,
        )),
      ),
    );
  }
}
