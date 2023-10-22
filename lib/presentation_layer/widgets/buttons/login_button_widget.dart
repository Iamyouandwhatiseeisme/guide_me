import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  const LoginButtonWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 60,
      child: FloatingActionButton(
        backgroundColor: const Color(0xffC75E6B),
        foregroundColor: const Color(0xffF3F0E6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        onPressed: () {
          signIn(context);
        },
        child: const Text(
          'Login',
          style: TextStyle(
              fontFamily: 'Parapraf',
              fontSize: 20,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }

  Future signIn(BuildContext context) async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }
}
