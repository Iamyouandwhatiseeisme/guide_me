import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffC75E6B), fixedSize: const Size(320, 60)),
        onPressed: () {
          Navigator.of(context).pushReplacementNamed('authPage');
        },
        child: const Text(
          'Get Started',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
