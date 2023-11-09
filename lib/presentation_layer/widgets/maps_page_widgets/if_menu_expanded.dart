import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guide_me/data_layer/models/map_item.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../../business_layer/cubit/is_exapnded_cubit.dart';

class IfMenuExpanded extends StatelessWidget {
  const IfMenuExpanded({
    super.key,
    required this.screenHeight,
    required this.controller,
    required this.lat,
    required this.lon,
    required this.listOfCategories,
    required this.apiKey,
    required this.mapItemListForRowOne,
    required this.screenWidth,
    required this.mapItemListForRowTwo,
  });

  final double screenHeight;
  final GoogleMapController controller;
  final double lat;
  final double lon;
  final List<String> listOfCategories;
  final String apiKey;
  final List<MapItem> mapItemListForRowOne;
  final double screenWidth;
  final List<MapItem> mapItemListForRowTwo;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocProvider(
        create: (context) => IsExapndedCubit(),
        child: Builder(builder: (context) {
          return BlocBuilder<IsExapndedCubit, bool>(
            builder: (context, state) {
              double topPosition =
                  state == true ? screenHeight / 1.8 - 132 : screenHeight / 1.8;
              return Positioned(
                  top: topPosition,
                  left: 16,
                  right: 16,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MapsToolbarWIthDirectionsLocationAndThreeDotsWidget(
                        controller: controller,
                        userLocation: LatLng(lat, lon),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      MapsTypesRowWidget(
                          listOfCategories: listOfCategories,
                          lon: lon,
                          lat: lat,
                          apiKey: apiKey,
                          screenHeight: screenHeight,
                          mapItemList: mapItemListForRowOne,
                          screenWidth: screenWidth),
                      const SizedBox(
                        height: 12,
                      ),
                      MapsTypesRowWidget(
                        apiKey: apiKey,
                        lat: lat,
                        lon: lon,
                        listOfCategories: listOfCategories,
                        screenHeight: screenHeight,
                        screenWidth: screenWidth,
                        mapItemList: mapItemListForRowTwo,
                      )
                    ],
                  ));
            },
          );
        }),
      );
    });
  }
}
