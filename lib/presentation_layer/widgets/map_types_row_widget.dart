import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class MapsTypesRowWidget extends StatelessWidget {
  final int numOfItems;
  const MapsTypesRowWidget({
    Key? key,
    required this.numOfItems,
    required this.screenWidth,
  }) : super(key: key);

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ContainerForTypesOfPlacesOnMapWidget(
            numOfItems: numOfItems,
            textLabel: 'Sights',
            iconToDisplay: const Icon(
              Icons.fort_outlined,
              color: Color(0xffF4C871),
            ),
            screenWidth: screenWidth),
        const SizedBox(
          width: 15,
        ),
        ContainerForTypesOfPlacesOnMapWidget(
            numOfItems: numOfItems,
            textLabel: 'Hotels',
            iconToDisplay: const Icon(
              Icons.hotel,
              color: Color(
                0xffA3C3DB,
              ),
            ),
            screenWidth: screenWidth),
        const SizedBox(
          width: 15,
        ),
        ContainerForTypesOfPlacesOnMapWidget(
            numOfItems: numOfItems,
            iconToDisplay: const Icon(
              Icons.nightlife,
              color: Color(0xffC75E6B),
            ),
            textLabel: 'Night life',
            screenWidth: screenWidth),
      ],
    );
  }
}
