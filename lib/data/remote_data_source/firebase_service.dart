import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../presentation/widgets/presentation_layer_widgets.dart';

class FirebaseService {
  Future<void> initFirebase() async {
    await Firebase.initializeApp();
  }

  Future resetPassword(
      TextEditingController emailController, BuildContext context) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child:
                  LoadingAnimationWidget.inkDrop(color: Colors.red, size: 40),
            ));
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Password reset E-Mail sent')));

        Navigator.of(context).popUntil((route) => route.isFirst);
      }
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message!)));
      }
    }
  }

  Future signUpWithEmail(
      {GlobalKey<FormState>? formKey,
      required TextEditingController emailController,
      required TextEditingController passwordController}) async {
    final isValid = formKey!.currentState!.validate();
    if (!isValid) return;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future changeDisplayName(
      {required TextEditingController nameController,
      required User user,
      required BuildContext context,
      required Function updateUI}) async {
    nameController.clear();
    showDialog(
        context: context,
        builder: (context) => DisplayNameDIalog(
              context: context,
              user: user,
              updateUI: updateUI,
              nameController: nameController,
            ));
  }
}
