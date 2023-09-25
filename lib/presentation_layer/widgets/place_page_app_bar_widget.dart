import 'package:flutter/material.dart';

class PlacePageAppbar extends StatelessWidget {
  const PlacePageAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        Icon(Icons.share_outlined),
        SizedBox(width: 24),
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: Icon(Icons.favorite_border),
        )
      ],
      backgroundColor: const Color(0xffF3F0E6),
    );
  }
}
