import 'package:flutter/material.dart';

class DontHaveAnAccountSignUpLabel extends StatelessWidget {
  const DontHaveAnAccountSignUpLabel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 16,
      width: 220,
      child: Row(
        children: [
          Text(
            'Don\'t have an account?',
            style: TextStyle(
                fontFamily: 'Telegraf',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xff292F32)),
          ),
          Text(
            'Sign up',
            style: TextStyle(
                decoration: TextDecoration.underline,
                fontFamily: 'Telegraf',
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0xff292F32)),
          )
        ],
      ),
    );
  }
}
