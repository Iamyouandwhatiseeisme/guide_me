import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../../business_layer/widgets/business_widgets.dart';

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
                MyTextField(
                  controller: widget.emailController,
                  label: 'Email',
                  hintText: 'Example@gmail.com',
                ),
                const SizedBox(height: 24),
                MyTextField(
                    controller: widget.passwordController,
                    label: 'Password',
                    hintText: 'Enter Password'),
                GoogleSignUpButton(
                    formKey: widget.formKey,
                    emailController: widget.emailController,
                    passwordController: widget.passwordController,
                    text: 'Sign up with E-Mail',
                    icon: const FaIcon(
                      Icons.mail,
                      color: Colors.red,
                    )),
                const GoogleSignUpButton(
                  text: 'Sign up with Google',
                  icon: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.red,
                  ),
                ),
                TextForSignUpOrSignIn(
                    onClick: widget.onClickedLogIn,
                    textToDisplay: "Already have an account? ",
                    signUpOrSignIn: 'Log in')
              ]),
            ),
          )
        ]),
      ),
    );
  }
}
