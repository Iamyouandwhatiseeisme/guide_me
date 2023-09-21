import 'package:flutter/material.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 60,
      child: FloatingActionButton(
        backgroundColor: const Color(0xffC75E6B),
        foregroundColor: const Color(0xffF3F0E6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
        onPressed: () {
          Navigator.pushNamed(context, 'firstPage');
        },
        child: const Text(
          'Login',
          style: TextStyle(
              fontFamily: 'Parapraf',
              fontSize: 20,
              fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}
