// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return const LoginPageWIdget();
  }
}

class LoginPageWIdget extends StatefulWidget {
  const LoginPageWIdget({
    super.key,
  });

  @override
  State<LoginPageWIdget> createState() => _LoginPageWIdgetState();
}

class _LoginPageWIdgetState extends State<LoginPageWIdget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F0E6),
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacementNamed('firstPage');
              });
              // Return a placeholder widget or loading indicator while navigating.
              return Center(
                child:
                    LoadingAnimationWidget.inkDrop(color: Colors.red, size: 40),
              );
            } else {
              return const AuthPageWidget();
            }
          }),
    );
  }
}
