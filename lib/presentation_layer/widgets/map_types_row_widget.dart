// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class MapsTypesRowWidget extends StatelessWidget {
  final double screenHeight;
  final List<MapItem> mapItemList;

  const MapsTypesRowWidget({
    Key? key,
    required this.screenHeight,
    required this.mapItemList,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (186 - 26) / 2,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return ContainerForTypesOfPlacesOnMapWidget(
              screenHeight: screenHeight,
              color: mapItemList[index].color,
              numOfItems: mapItemList.length,
              textLabel: mapItemList[index].textLabel,
              screenWidth: screenWidth,
              iconToDisplay: mapItemList[index].icon,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Container(width: 15);
          },
          itemCount: mapItemList.length),
    );
  }
}
