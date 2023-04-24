import 'package:banana_challenge_app/l10n/l10n.dart';
import 'package:banana_challenge_app/login/cubit/login_cubit.dart';
import 'package:banana_challenge_app/login/cubit/login_state.dart';
import 'package:banana_challenge_app/login/widgets/login_forms.dart';
import 'package:banana_challenge_app/product/view/product_list_view.dart';
import 'package:banana_challenge_app/widgets/banana_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:resize/resize.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: const LoginView(),
    );
  }
}

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static const routeName = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status.isSuccess) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const ProductPage(),
            ),
          );
        }

        if (state.status.isError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(l10n.invalidCredentials),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
              left: 15.sp,
              right: 15.sp,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    l10n.welcomeLoginScreen,
                    style: TextStyle(
                      fontSize: 50.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(
                  height: 100.sp,
                ),
                BananaForms(
                  isPassword: false,
                  labelText: l10n.usernameFormField,
                  controller: _usernameController,
                ),
                SizedBox(
                  height: 20.sp,
                ),
                BananaForms(
                  isPassword: true,
                  labelText: l10n.passwordFormField,
                  controller: _passwordController,
                ),
                SizedBox(
                  height: 40.sp,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 50.sp,
                  child: BananaButton(
                    onPressed: () => context.read<LoginCubit>().loginUser(
                          username: _usernameController.text,
                          password: _passwordController.text,
                        ),
                    text: l10n.signInButtonText,
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
