// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:guide_me/business_layer/widgets/business_widgets.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F0E6),
      body: Stack(
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
                const MyTextField(
                  label: 'Email',
                  hintText: 'Example@gmail.com',
                ),
                const SizedBox(height: 24),
                const MyTextField(
                    label: 'Password', hintText: 'Enter Password'),
                const ForgotPasswordLabel(),
                const SizedBox(
                  height: 44,
                ),
                const LoginButtonWidget(),
                const SizedBox(
                  height: 16,
                ),
                const DontHaveAnAccountSignUpLabel(),
                const SizedBox(
                  height: 30,
                ),
                const DividerWidget(),
                SignInWithButtonWIdget(
                  heroTag: 'bas1',
                  logo: 'assets/images/logos/facebook logo.png',
                  label: 'Facebook',
                ),
                SizedBox(
                  height: 20,
                ),
                SignInWithButtonWIdget(
                  heroTag: 'bas2',
                  logo: 'assets/images/logos/google logo.png',
                  label: 'Google',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
