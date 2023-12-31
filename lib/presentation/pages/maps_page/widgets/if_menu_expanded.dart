import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

import '../../../../bloc/cubits.dart';
import '../../../../data/data.dart';

class IfMenuExpanded extends StatelessWidget {
  const IfMenuExpanded({
    super.key,
    required this.screenHeight,
    required this.controller,
    required this.listOfCategories,
    required this.mapItemListForRowOne,
    required this.screenWidth,
    required this.mapItemListForRowTwo,
  });

  final double screenHeight;
  final GoogleMapController controller;

  final List<String> listOfCategories;

  final List<GoogleMapsPageCategoryItem> mapItemListForRowOne;
  final double screenWidth;
  final List<GoogleMapsPageCategoryItem> mapItemListForRowTwo;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return BlocProvider(
        create: (context) => IsExapndedCubit(),
        child: Builder(builder: (context) {
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
                        controller: controller,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      MapsTypesRowWidget(
                          listOfCategories: listOfCategories,
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
        }),
      );
    });
  }
}
