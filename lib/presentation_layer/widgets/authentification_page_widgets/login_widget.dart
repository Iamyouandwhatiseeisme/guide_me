import 'package:flutter/material.dart';
import 'package:guide_me/data_layer/constants/language_constants.dart';

import '../presentation_layer_widgets.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required this.onClickedSignUp,
  })  : _emailController = emailController,
        _passwordController = passwordController;
  final VoidCallback onClickedSignUp;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  controller: widget._emailController,
                  label: translation(context).email,
                  hintText: 'Example@gmail.com',
                ),
                const SizedBox(height: 24),
                AuthPageTextField(
                    controller: widget._passwordController,
                    label: translation(context).password,
                    hintText: translation(context).enterPassword),
                const ForgotPasswordLabel(),
                const SizedBox(
                  height: 44,
                ),
                LoginButtonWidget(
                  formKey: formKey,
                  emailController: widget._emailController,
                  passwordController: widget._passwordController,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextForSignUpOrSignIn(
                  signUpOrSignIn: translation(context).signup,
                  textToDisplay: translation(context).dontHaveAccount,
                  onClick: widget.onClickedSignUp,
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
    );
  }
}
