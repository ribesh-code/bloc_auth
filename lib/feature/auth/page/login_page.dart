import 'package:bloc_auth/design/organisms/login_form/login_form.dart';
import 'package:bloc_auth/design/organisms/login_form/login_form_args.dart';
import 'package:bloc_auth/design/theme/app_color.dart';
import 'package:bloc_auth/domain/entity/login_credentials.dart';
import 'package:bloc_auth/feature/auth/bloc/auth_bloc.dart';
import 'package:bloc_auth/feature/auth/usecase/login_usecase.dart';
import 'package:bloc_auth/feature/home/home_page.dart';
import 'package:bloc_auth/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode storeCodeFocusNode = FocusNode();
  final FocusNode loginIdFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final loginUseCase = getItInstance<LoginUseCase>();
  bool isLoading = false;
  late AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = getItInstance<AuthBloc>();
  }

  void _onSubmit() {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      _authBloc.add(
        LogIn(
          LoginCredentials(
            username: _userNameController.text,
            password: _passwordController.text,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      bloc: _authBloc,
      listener: (context, state) {
        if (state.status == AuthStatus.authenticated) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const HomePage(),
          ));
        }

        if (state.status == AuthStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.errorCode),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text('Login Page',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.white,
                    )),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Text(
                'Welcome back!!',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: LoginForm(
                  loginFormArgs: LoginFormArgs(
                    formKey: formKey,
                    userNameController: _userNameController,
                    passwordController: _passwordController,
                    onLoginPress: _onSubmit,
                    isLoading: state.status == AuthStatus.authenticating,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
