import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

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

              return const LoadingAnimationScaffold();
            } else {
              return const AuthPageWidget();
            }
          }),
    );
  }
}
