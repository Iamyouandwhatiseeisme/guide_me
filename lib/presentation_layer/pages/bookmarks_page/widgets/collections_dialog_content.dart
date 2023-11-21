import 'package:flutter/material.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../data_layer/models/collection_model.dart';

class CollectionsDialogContent extends StatelessWidget {
  const CollectionsDialogContent({
    super.key,
    required this.distance,
    required this.image,
    required this.iconToDisplay,
    required this.textLabel,
    required this.placeToAdd,
    required this.snackBar,
    required TextEditingController textController,
  }) : _textController = textController;
  final double distance;
  final String image;
  final Icon iconToDisplay;
  final String textLabel;
  final NearbyPlacesModel placeToAdd;
  final SnackBar snackBar;
  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable:
            Hive.box<CollectionModel>('CollectionLists').listenable(),
        builder: (context, box, child) {
          final List<CollectionModel> listOfCollections =
              Hive.box<CollectionModel>("CollectionLists")
                  .toMap()
                  .values
                  .toList();
          String userRatingTotal = placeToAdd.userRatingsTotal.toString();
          String transformedUserRatingTotal =
              '${userRatingTotal.substring(0, 1)},${userRatingTotal.substring(1)}';
          String type = placeToAdd.types[0]
                  .toString()
                  .substring(0, 1)
                  .toUpperCase() +
              placeToAdd.types[0].toString().substring(1).replaceAll('_', ' ');
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AddToCollectionsDialogTopTabWIthLabelIconAndExitButton(
                    iconToDisplay: iconToDisplay, textLabel: textLabel),
                PlaceToAddToCollectionsCard(
                    image: image,
                    placeToAdd: placeToAdd,
                    userRatingTotal: userRatingTotal,
                    transformedUserRatingTotal: transformedUserRatingTotal,
                    type: type,
                    distance: distance),
                ListViewBuilderForCollectionsLists(
                    listOfCollections: listOfCollections,
                    placeToAdd: placeToAdd,
                    snackBar: snackBar),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Swipe collection to delete',
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                CreateNewCollectionButton(textController: _textController)
              ],
            ),
          );
        });
  }
}
