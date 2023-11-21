import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guide_me/presentation/pages/pages.dart';

import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
    required this.onClickedLogIn,
    required this.emailController,
    required this.passwordController,
  });

  final VoidCallback onClickedLogIn;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //takes user to email verification page
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingAnimationScaffold();
          } else if (snapshot.hasData) {
            return const VerifyEmailPage();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something Went Wrong'));
          } else {
            return SignUpPageWidgets(
                emailController: widget.emailController,
                passwordController: widget.passwordController,
                onClickedLogIn: widget.onClickedLogIn);
          }
        });
  }
}
