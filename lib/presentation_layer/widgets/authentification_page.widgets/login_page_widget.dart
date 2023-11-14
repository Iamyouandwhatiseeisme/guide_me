import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
      backgroundColor: Theme.of(context).primaryColor,
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.of(context).pushReplacementNamed('firstPage');
              });
              // Return a placeholder widget or loading indicator while navigating.
              return Scaffold(
                body: Center(
                  child: LoadingAnimationWidget.inkDrop(
                      color: Colors.red, size: 40),
                ),
              );
            } else {
              return const AuthPageWidget();
            }
          }),
    );
  }
}
