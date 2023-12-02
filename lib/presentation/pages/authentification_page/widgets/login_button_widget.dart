import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/presentation/widgets/navigation/navigator_client.dart';

class LoginButtonWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  const LoginButtonWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SingInWithEmailCubit(),
      child: Builder(builder: (context) {
        return BlocListener<SingInWithEmailCubit, SingInWithEmailState>(
          listener: (context, state) {
            if (state is SignInWithEmailError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.errorMessage),
                ),
              );
            }
          },
          child: SizedBox(
            width: 320,
            height: 60,
            child: FloatingActionButton(
              backgroundColor: const Color(0xffC75E6B),
              foregroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32)),
              onPressed: () {
                BlocProvider.of<SingInWithEmailCubit>(context).signInWithEmail(
                    context: context,
                    formKey: formKey,
                    emailController: emailController,
                    passwordController: passwordController);
                Navigator.pushReplacementNamed(
                    context, NavigatorClient.authPage);
              },
              child: const Text(
                'Login',
                style: TextStyle(
                    fontFamily: 'Parapraf',
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
        );
      }),
    );
  }
}
