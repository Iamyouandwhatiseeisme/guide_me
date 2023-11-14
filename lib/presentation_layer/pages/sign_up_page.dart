import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/pages/pages.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: LoadingAnimationWidget.inkDrop(
                    color: Colors.red, size: 20));
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
