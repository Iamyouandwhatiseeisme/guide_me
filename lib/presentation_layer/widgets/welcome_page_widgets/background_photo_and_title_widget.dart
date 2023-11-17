import 'package:flutter/material.dart';

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
    return Expanded(
      child: Column(
        children: [
          Image.asset(
            'assets/images/$photo',
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
      ),
    );
  }
}
