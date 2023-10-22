import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Future resetPassword(
    TextEditingController emailController, BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Center(
            child: LoadingAnimationWidget.inkDrop(color: Colors.red, size: 40),
          ));
  try {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: emailController.text.trim());
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password reset E-Mail sent')));
    Navigator.of(context).popUntil((route) => route.isFirst);
  } on FirebaseAuthException catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.message!)));

    // TODO
  }
}
