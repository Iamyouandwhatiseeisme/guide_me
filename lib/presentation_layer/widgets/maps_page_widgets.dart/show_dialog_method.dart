import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

void showDIalogWindow(
    BuildContext context,
    double screenHeight,
    double screenWidth,
    dynamic iconToDisplay,
    String textLabel,
    List<String>? listOfCategories,
    final double lat,
    final double lon,
    final String apiKey) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      if (listOfCategories == null) {
        return ADialogWithoutListOfCategories(
          lat: lat,
          lon: lon,
          apiKey: apiKey,
          textLabel: textLabel,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          iconToDisplay: iconToDisplay,
        );
      } else {
        return ADialogWithInterfaceListCategories(
            lat: lat,
            lon: lon,
            apiKey: apiKey,
            listOfCategories: listOfCategories,
            textLabel: textLabel,
            iconToDisplay: iconToDisplay,
            screenHeight: screenHeight,
            screenWidth: screenWidth);
      }
    },
  );
}
