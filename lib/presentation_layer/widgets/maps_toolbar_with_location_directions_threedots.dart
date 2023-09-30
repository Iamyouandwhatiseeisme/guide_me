import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MapsToolbarWIthDirectionsLocationAndThreeDotsWidget
    extends StatelessWidget {
  const MapsToolbarWIthDirectionsLocationAndThreeDotsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: screenWidth - 32 - 127,
          height: 48,
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xff292F32).withOpacity(0.75)),
            width: 127,
            height: 48,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/Arrow.png'),
                  Icon(
                    Icons.directions_outlined,
                    color: Color(0xffF3F0E6),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Color(0xffF3F0E6),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
