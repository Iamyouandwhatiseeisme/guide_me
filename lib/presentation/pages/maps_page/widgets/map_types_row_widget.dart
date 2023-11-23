// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:guide_me/data/data.dart';
import 'package:guide_me/main.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class MapsTypesRowWidget extends StatelessWidget {
  final double screenHeight;
  final List<GoogleMapsPageCategoryItem> mapItemList;
  final List<String>? listOfCategories;

  const MapsTypesRowWidget({
    Key? key,
    required this.screenHeight,
    required this.mapItemList,
    this.listOfCategories,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (186 - 26) / 2,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            final UserLocation userLocation = sl.get<UserLocation>();
            return ContainerForTypesOfPlacesOnMapWidget(
              userLocation: userLocation,
              listOfCategories: listOfCategories,
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
