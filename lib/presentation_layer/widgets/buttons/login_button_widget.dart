import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginButtonWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
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
          signIn();
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

  Future signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
    } on Exception catch (e) {
      throw ('print: $e');
    }
  }
}
