import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future signUpWithEmail(
    GlobalKey<FormState>? formKey,
    TextEditingController emailController,
    TextEditingController passwordController) async {
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
