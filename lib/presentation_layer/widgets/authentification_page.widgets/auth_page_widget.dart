import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/pages/pages.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class AuthPageWidget extends StatefulWidget {
  const AuthPageWidget({
    super.key,
  });

  @override
  State<AuthPageWidget> createState() => _AuthPageWidgetState();
}

class _AuthPageWidgetState extends State<AuthPageWidget> {
  bool isLogin = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? LoginWidget(
            onClickedSignUp: toggle,
            emailController: _emailController,
            passwordController: _passwordController)
        : SignUpPage(
            emailController: _emailController,
            passwordController: _passwordController,
            onClickedLogIn: toggle,
          );
  }

  void toggle() => setState(() {
        isLogin = !isLogin;
      });
}
