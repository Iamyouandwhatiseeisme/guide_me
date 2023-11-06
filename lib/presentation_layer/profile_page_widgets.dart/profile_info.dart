import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Container(
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(child: Image.network(user.photoURL!))),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              user.displayName!,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.15),
            ),
            Text(
              user.email!,
              style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  letterSpacing: 0.15),
            )
          ],
        ),
      ],
    );
  }
}
