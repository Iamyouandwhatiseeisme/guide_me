// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpWithButton extends StatelessWidget {
  const SignUpWithButton({
    Key? key,
    this.emailController,
    this.passwordController,
    required this.text,
    required this.icon,
    this.formKey,
    required this.onPressed,
  }) : super(key: key);
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final String text;
  final FaIcon icon;
  final GlobalKey<FormState>? formKey;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton.icon(
          icon: icon,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            print('running');
            onPressed();
          },
          label: Text(text)),
    );
  }
}
