// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guide_me/business_layer/cubit/is_exapnded_cubit.dart';

import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class MapsPageContent extends StatelessWidget {
  const MapsPageContent({
    Key? key,
    required this.screenHeight,
    required this.controller,
    required this.lat,
    required this.lon,
    required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final GoogleMapController? controller;
  final double lat;
  final double lon;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    bool isExpanded = true;
    List<MapItem> mapItemListForRowOne = [];
    List<MapItem> mapItemListForRowTwo = [];
    List<String> listOfCategories = [];
    createLists(mapItemListForRowOne, mapItemListForRowTwo, listOfCategories);

    return Builder(builder: (context) {
      return BlocBuilder<IsExapndedCubit, bool>(
        builder: (context, state) {
          double topPosition =
              state == true ? screenHeight / 2.2 - 132 : screenHeight / 2.2;
          return Positioned(
              top: topPosition,
              left: 16,
              right: 16,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MapsToolbarWIthDirectionsLocationAndThreeDotsWidget(
                    isExpanded: isExpanded,
                    controller: controller,
                    userLocation: LatLng(lat, lon),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  CustomMapsTextField(screenWidth: screenWidth),
                  const SizedBox(
                    height: 12,
                  ),
                  MapsTypesRowWidget(
                      screenHeight: screenHeight,
                      mapItemList: mapItemListForRowOne,
                      screenWidth: screenWidth),
                  const SizedBox(
                    height: 12,
                  ),
                  MapsTypesRowWidget(
                    listOfCategories: listOfCategories,
                    screenHeight: screenHeight,
                    screenWidth: screenWidth,
                    mapItemList: mapItemListForRowTwo,
                  )
                ],
              ));
        },
      );
    });
  }
}
