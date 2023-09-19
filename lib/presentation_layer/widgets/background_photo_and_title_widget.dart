import 'package:flutter/material.dart';

import '../pages/pages.dart';

class BackgroundPhotoAndTitleWidget extends StatelessWidget {
  final String pageTitle;
  final String photo;
  const BackgroundPhotoAndTitleWidget({
    super.key,
    required this.pageTitle,
    required this.photo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          photo,
          width: 370,
          height: 370,
        ),
        Text(
          pageTitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontFamily: 'Telegraf', fontSize: 30, color: Color(0xff292F32)),
        ),
      ],
    );
  }
}
