import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/custom_bottom_navigatio_bar_widget.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginPageWIdget extends StatefulWidget {
  final String apiKey;
  final CustomBottomNavigationBar bottomNavigationBar;
  const LoginPageWIdget({
    super.key,
    required this.apiKey,
    required this.bottomNavigationBar,
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
              return Scaffold(
                body: Center(
                  child: LoadingAnimationWidget.inkDrop(
                      color: Colors.red, size: 40),
                ),
              );
            } else {
              return AuthPageWidget(
                apiKey: widget.apiKey,
                bottomNavigationBar: widget.bottomNavigationBar,
              );
            }
          }),
    );
  }
}
