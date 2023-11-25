import 'package:flutter/material.dart';

class RedButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  const RedButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffC75E6B),
            fixedSize: const Size(320, 60)),
        onPressed: () {
          onPressed();
        },
        child: Text(
          label,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
