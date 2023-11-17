import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/bookmarks_page_widgets/build_dialog_for_collections_page.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../../data_layer/data.dart';
import '../../../data_layer/models/nearby_places_model.dart';

void showDIalogWindow(
  final double? distance,
  String? image,
  BuildContext context,
  double screenHeight,
  double screenWidth,
  dynamic iconToDisplay,
  String textLabel,
  List<String>? listOfCategories,
  final UserLocation? userLocation,
  final NearbyPlacesModel? plateToAdd,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return userLocation == null
          ? buildADialogWindowForCollectionsPage(distance!, image!, textLabel,
              screenHeight, screenWidth, iconToDisplay, plateToAdd!)
          : listOfCategories == null
              ? buildDialogWithoutListOfCategories(
                  textLabel,
                  screenHeight,
                  screenWidth,
                  iconToDisplay,
                )
              : buildDialogWithListOfCategories(
                  listOfCategories,
                  textLabel,
                  iconToDisplay,
                  screenHeight,
                  screenWidth,
                );
    },
  );
}

Widget buildDialogWithoutListOfCategories(
  String textLabel,
  double screenHeight,
  double screenWidth,
  dynamic iconToDisplay,
) {
  return ADialogWithoutListOfCategories(
    textLabel: textLabel,
    screenHeight: screenHeight,
    screenWidth: screenWidth,
    iconToDisplay: iconToDisplay,
  );
}

Widget buildADialogWindowForCollectionsPage(
  final double distance,
  String image,
  String textLabel,
  double screenHeight,
  double screenWidth,
  dynamic iconToDisplay,
  final NearbyPlacesModel plateToAdd,
) {
  return BuildDialogForCollectionsPage(
    distance: distance,
    image: image,
    textLabel: textLabel,
    screenHeight: screenHeight,
    screenWidth: screenWidth,
    iconToDisplay: iconToDisplay,
    placeToAdd: plateToAdd,
  );
}

Widget buildDialogWithListOfCategories(
  List<String> listOfCategories,
  String textLabel,
  dynamic iconToDisplay,
  double screenHeight,
  double screenWidth,
) {
  return ADialogWithInterfaceListCategories(
    listOfCategories: listOfCategories,
    textLabel: textLabel,
    iconToDisplay: iconToDisplay,
    screenHeight: screenHeight,
    screenWidth: screenWidth, // Pass the FavoritesCubit
  );
}
