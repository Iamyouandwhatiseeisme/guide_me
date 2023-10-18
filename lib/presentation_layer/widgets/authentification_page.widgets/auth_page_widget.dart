import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/pages/pages.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class AuthPageWidget extends StatefulWidget {
  const AuthPageWidget({
    super.key,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  })  : _emailController = emailController,
        _passwordController = passwordController;

  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  State<AuthPageWidget> createState() => _AuthPageWidgetState();
}

class _AuthPageWidgetState extends State<AuthPageWidget> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginWidget(
            onClickedSignUp: toggle,
            emailController: widget._emailController,
            passwordController: widget._passwordController)
        : SignUpPage(
            onClickedLogIn: toggle,
          );
  }

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
