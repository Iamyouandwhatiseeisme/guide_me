// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class ContainerForTypesOfPlacesOnMapWidget extends StatelessWidget {
  final double? lat;
  final double? lon;
  final double screenHeight;
  final Color color;
  final int numOfItems;
  final String textLabel;
  final dynamic iconToDisplay;
  final List<String>? listOfCategories;
  final String apiKey;

  const ContainerForTypesOfPlacesOnMapWidget({
    Key? key,
    this.lat,
    this.lon,
    required this.screenHeight,
    required this.color,
    required this.numOfItems,
    required this.textLabel,
    required this.iconToDisplay,
    this.listOfCategories,
    required this.apiKey,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (textLabel != 'Other') {
          showDIalogWindow(context, screenHeight, screenWidth, iconToDisplay,
              textLabel, null, lat!, lon!, apiKey);
        } else {
          showDIalogWindow(context, screenHeight, screenWidth, iconToDisplay,
              textLabel, listOfCategories, lat!, lon!, apiKey);
        }
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
                textLabel,
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
}
