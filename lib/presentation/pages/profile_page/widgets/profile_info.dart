// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:guide_me/data/constants/language_constants.dart';

class ProfileInfo extends StatefulWidget {
  final User user;
  const ProfileInfo({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
    // print('print ${user.displayName}');

    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 12),
          child: Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(
                  child: Image.network(widget.user.photoURL ??
                      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'))),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.user.displayName ??
                  translation(context).noNameSpecifiedYet,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.15),
            ),
            Text(
              widget.user.email!,
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
