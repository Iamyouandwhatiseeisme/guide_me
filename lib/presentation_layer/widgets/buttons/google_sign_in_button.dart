import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/data_layer/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class GoogleSignUpButton extends StatelessWidget {
  const GoogleSignUpButton({
    super.key,
    required this.text,
    required this.icon,
    this.formKey,
    this.emailController,
    this.passwordController,
  });
  final TextEditingController? emailController;
  final TextEditingController? passwordController;
  final String text;
  final FaIcon icon;
  final GlobalKey<FormState>? formKey;

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
            if (text.contains('Google')) {
              final provider =
                  Provider.of<GoogleSignInprovider>(context, listen: false);

              provider.googleLogin();
            } else if (text.contains('E-Mail')) {
              signUpWithEmail(formKey, emailController!, passwordController!);
            }
          },
          label: Text(text)),
    );
  }
}
