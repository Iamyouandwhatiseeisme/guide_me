import 'package:flutter/material.dart';

class ForgotPasswordLabel extends StatelessWidget {
  const ForgotPasswordLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, right: 40),
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'forgotPassword'),
          child: const Text(
            'Forgot password?',
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: 'Telegraf',
                fontWeight: FontWeight.w400,
                color: Color(0xff292F32)),
          ),
        ),
      ),
    );
  }
}
