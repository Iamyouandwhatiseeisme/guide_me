import 'package:flutter/material.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class BuildDialogForCollectionsPage extends BuildADialogOnMapsWindowWidget {
  final NearbyPlacesModel placeToAdd;
  final double distance;
  final String image;
  const BuildDialogForCollectionsPage({
    super.key,
    required this.image,
    required super.textLabel,
    required super.iconToDisplay,
    required super.screenHeight,
    required super.screenWidth,
    required this.placeToAdd,
    required this.distance,
    super.userLocation,
  });
  @override
  Widget build(BuildContext context) {
    const snackBar = SnackBar(
      content: Text('Item already added'),
    );
    TextEditingController textController = TextEditingController();
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff292F32),
            borderRadius: BorderRadius.circular(16)),
        height: screenHeight - 136,
        width: screenWidth,
        child: CollectionsDialogContent(
            distance: distance,
            image: image,
            iconToDisplay: iconToDisplay,
            textLabel: textLabel,
            placeToAdd: placeToAdd,
            snackBar: snackBar,
            textController: textController),
      ),
    );
  }
}
