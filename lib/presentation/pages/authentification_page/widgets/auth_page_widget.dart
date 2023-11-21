import 'package:flutter/material.dart';
import 'package:guide_me/presentation/pages/pages.dart';

import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class AuthPageContent extends StatefulWidget {
  const AuthPageContent({
    super.key,
  });

  @override
  State<AuthPageContent> createState() => _AuthPageContentState();
}

class _AuthPageContentState extends State<AuthPageContent> {
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
    //displays login page, if the  user clicks the signup button on login page, displays signup page
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
