import 'package:flutter/material.dart';
import 'package:guide_me/data/data.dart';

import '../../../widgets/presentation_layer_widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          Image.asset('assets/images/Eclipse smaller.png'),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                  ),
                  Image.asset('assets/images/GuideMe (1) 3.png'),
                  const SizedBox(
                    height: 120,
                  ),
                  AuthPageTextField(
                    controller: _emailController,
                    label: translation(context).email,
                    hintText: 'Example@gmail.com',
                  ),
                  const SizedBox(height: 24),
                  AuthPageTextField(
                      controller: _passwordController,
                      label: translation(context).password,
                      hintText: translation(context).enterPassword),
                  const ForgotPasswordLabel(),
                  const SizedBox(
                    height: 44,
                  ),
                  LoginButtonWidget(
                    formKey: formKey,
                    emailController: _emailController,
                    passwordController: _passwordController,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextForSignUpOrSignIn(
                    shouldSignUp: true,
                    signUpOrSignIn: translation(context).signup,
                    textToDisplay: translation(context).dontHaveAccount,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const DividerWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  const SignInWithButtonWIdget(
                    heroTag: 'bas2',
                    logo: 'assets/images/logos/google logo.png',
                    label: 'Google',
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
