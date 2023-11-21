import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../../data_layer/constants/language_constants.dart';

class SignUpPageWidgets extends StatefulWidget {
  SignUpPageWidgets({
    super.key,
    required this.onClickedLogIn,
    required this.emailController,
    required this.passwordController,
  });
  final VoidCallback onClickedLogIn;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final formKey = GlobalKey<FormState>();

  @override
  State<SignUpPageWidgets> createState() => _SignUpPageWidgetsState();
}

class _SignUpPageWidgetsState extends State<SignUpPageWidgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA3C3DB),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Form(
              key: widget.formKey,
              child: Column(children: <Widget>[
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
                Text(
                  translation(context).welcomeToGuideMe,
                  style: const TextStyle(
                      fontFamily: 'paragraf',
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  translation(context).chooseAuthMethod,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'paragraf',
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
                AuthPageTextField(
                  controller: widget.emailController,
                  label: translation(context).email,
                  hintText: 'Example@gmail.com',
                ),
                const SizedBox(height: 24),
                AuthPageTextField(
                    controller: widget.passwordController,
                    label: translation(context).password,
                    hintText: translation(context).enterPassword),
                GoogleSignUpButton(
                    formKey: widget.formKey,
                    emailController: widget.emailController,
                    passwordController: widget.passwordController,
                    text: translation(context).signUpWithMail,
                    icon: const FaIcon(
                      Icons.mail,
                      color: Colors.red,
                    )),
                GoogleSignUpButton(
                  text: translation(context).signUpWithGoogle,
                  icon: const FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                ),
                TextForSignUpOrSignIn(
                    onClick: widget.onClickedLogIn,
                    textToDisplay: translation(context).alreadyHaveAccount,
                    signUpOrSignIn: translation(context).login)
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
