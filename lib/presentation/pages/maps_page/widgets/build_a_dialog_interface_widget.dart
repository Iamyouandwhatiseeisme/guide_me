// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:guide_me/data/data.dart';

abstract class BuildADialogOnMapsWindowWidget extends StatelessWidget {
  final String textLabel;
  final dynamic iconToDisplay;
  final double screenHeight;
  final double screenWidth;
  final UserLocation? userLocation;
  const BuildADialogOnMapsWindowWidget({
    Key? key,
    required this.textLabel,
    required this.iconToDisplay,
    required this.screenHeight,
    required this.screenWidth,
    this.userLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff292F32),
            borderRadius: BorderRadius.circular(16)),
        height: screenHeight - 136,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20, top: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  iconToDisplay,
                  Text(
                    textLabel,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        color: Color(0xffF3F0E6)),
                  ),
                  GestureDetector(
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
