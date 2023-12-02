import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:guide_me/data/data.dart';

import 'package:guide_me/main.dart';
import 'package:guide_me/presentation/widgets/navigation/navigator_client.dart';
import 'package:provider/provider.dart';

class SignUpWithButton extends StatelessWidget {
  const SignUpWithButton({
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
    final firebaseService = sl.get<FirebaseService>();
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
            if (text.contains(translation(context).signUpWithGoogle)) {
              final provider =
                  Provider.of<GoogleSignInprovider>(context, listen: false);

              provider.googleLogin();
            } else if (text.contains('მეილით') || text.contains(('mail'))) {
              firebaseService.signUpWithEmail(
                  formKey: formKey,
                  emailController: emailController!,
                  passwordController: passwordController!);
              Navigator.pushNamed(context, NavigatorClient.verifyEmailPage);
            }
          },
          label: Text(text)),
    );
  }
}
