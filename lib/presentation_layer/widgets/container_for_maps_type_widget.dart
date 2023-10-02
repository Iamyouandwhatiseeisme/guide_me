// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:guide_me/data_layer/data.dart';

class ContainerForTypesOfPlacesOnMapWidget extends StatelessWidget {
  final double screenHeight;
  final Color color;
  final int numOfItems;
  final String textLabel;
  final dynamic iconToDisplay;

  const ContainerForTypesOfPlacesOnMapWidget({
    Key? key,
    required this.screenHeight,
    required this.color,
    required this.numOfItems,
    required this.textLabel,
    required this.iconToDisplay,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDIalogWindow(
            context, screenHeight, screenWidth, iconToDisplay, textLabel);
      },
      child: Container(
        width: (screenWidth - 20 - 15 * numOfItems - 1) / numOfItems,
        height: (186 - 26) / 2,
        decoration: BoxDecoration(
            border: Border(left: BorderSide(width: 1, color: color)),
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xff292F32).withOpacity(0.75)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              iconToDisplay,
              Text(
                '$textLabel',
                style: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: Color(0xffF3F0E6)),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showDIalogWindow(BuildContext context, double screenHeight,
      double screenWidth, dynamic iconToDisplay, String textLabel) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BuildADialogOnMapsWindowWidget(
          textLabel: textLabel,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          iconToDisplay: iconToDisplay,
        );
      },
    );
  }
}

class BuildADialogOnMapsWindowWidget extends StatelessWidget {
  final String textLabel;
  final dynamic iconToDisplay;
  final double screenHeight;
  final double screenWidth;
  const BuildADialogOnMapsWindowWidget({
    Key? key,
    required this.textLabel,
    required this.iconToDisplay,
    required this.screenHeight,
    required this.screenWidth,
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
                        color: Color(0xffF3F0E6).withOpacity(0.25),
                      ),
                      child: Icon(
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
