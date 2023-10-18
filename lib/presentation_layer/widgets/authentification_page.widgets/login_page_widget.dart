import 'package:flutter/material.dart';

import '../../../business_layer/widgets/business_widgets.dart';
import '../presentation_layer_widgets.dart';

class LoginWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Image.asset('assets/images/Eclipse smaller.png'),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
              MyTextField(
                controller: _emailController,
                label: 'Email',
                hintText: 'Example@gmail.com',
              ),
              const SizedBox(height: 24),
              MyTextField(
                  controller: _passwordController,
                  label: 'Password',
                  hintText: 'Enter Password'),
              const ForgotPasswordLabel(),
              const SizedBox(
                height: 44,
              ),
              LoginButtonWidget(
                emailController: _emailController,
                passwordController: _passwordController,
              ),
              const SizedBox(
                height: 16,
              ),
              TextForSignUpOrSignIn(
                signUpOrSignIn: 'Sign up',
                textToDisplay: 'Don\'t have an account?',
                onClick: onClickedSignUp,
              ),
              const SizedBox(
                height: 30,
              ),
              const DividerWidget(),
              const SignInWithButtonWIdget(
                heroTag: 'bas1',
                logo: 'assets/images/logos/facebook logo.png',
                label: 'Facebook',
              ),
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
        )
      ],
    );
  }
}
