import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/pages/pages.dart';
import 'package:guide_me/presentation_layer/widgets/first_page_widgets/custom_bottom_navigatio_bar_widget.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class SignUpPage extends StatefulWidget {
  final String apiKey;
  final CustomBottomNavigationBar bottomNavigationBar;
  const SignUpPage(
      {super.key,
      required this.onClickedLogIn,
      required this.emailController,
      required this.passwordController,
      required this.apiKey,
      required this.bottomNavigationBar});

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
            return VerifyEmailPage(
              bottomNavigationBar: widget.bottomNavigationBar,
              apiKey: widget.apiKey,
            );
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
