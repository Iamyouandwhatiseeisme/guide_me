import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:provider/provider.dart';

import '../../../data_layer/provider/google_sign_in.dart';

class SignUpPageWidgets extends StatelessWidget {
  const SignUpPageWidgets({
    super.key,
    required this.onClickedLogIn,
  });
  final VoidCallback onClickedLogIn;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA3C3DB),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Stack(children: <Widget>[
          Column(children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Image.asset(
                'assets/images/GuideMe (1) 3.png',
                height: 159.3,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Hey there!\nWelcome to GuideMe',
              style: TextStyle(
                  fontFamily: 'paragraf',
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Choose your preffered way of\nauthentication.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'paragraf',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const GoogleSignUpButton(),
            TextForSignUpOrSignIn(
                onClick: onClickedLogIn,
                textToDisplay: "Already have an account? ",
                signUpOrSignIn: 'Log in')
          ])
        ]),
      ),
    );
  }
}

class GoogleSignUpButton extends StatelessWidget {
  const GoogleSignUpButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ElevatedButton.icon(
          icon: const FaIcon(
            FontAwesomeIcons.google,
            color: Colors.red,
          ),
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          onPressed: () {
            final provider =
                Provider.of<GoogleSignInprovider>(context, listen: false);
            provider.googleLogin();
          },
          label: const Text('Sign up with Google')),
    );
  }
}
