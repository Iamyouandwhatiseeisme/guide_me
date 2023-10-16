import 'package:flutter/material.dart';

class ExitDialogButton extends StatelessWidget {
  const ExitDialogButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xffF3F0E6).withOpacity(0.25),
        ),
        child: const Icon(
          Icons.close_rounded,
          color: Color(0xffF3F0E6),
        ),
      ),
    );
  }
}
