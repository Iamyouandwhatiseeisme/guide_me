// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

class ContainerForTypesOfPlacesOnMapWidget extends StatelessWidget {
  final int numOfItems;
  final String textLabel;
  final Icon iconToDisplay;
  const ContainerForTypesOfPlacesOnMapWidget({
    Key? key,
    required this.numOfItems,
    required this.textLabel,
    required this.iconToDisplay,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (screenWidth - (34 + (numOfItems - 1) * 15)) / 3,
      height: (186 - 26) / 2,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xff292F32).withOpacity(0.75)),
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            iconToDisplay,
            Text(
              '$textLabel',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: Color(0xffF3F0E6)),
            )
          ],
        ),
      ),
    );
  }
}
