import 'package:flutter/material.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class PlaceToAddToCollectionsCard extends StatelessWidget {
  const PlaceToAddToCollectionsCard({
    super.key,
    required this.image,
    required this.placeToAdd,
    required this.userRatingTotal,
    required this.transformedUserRatingTotal,
    required this.type,
    required this.distance,
  });

  final String image;
  final NearbyPlacesModel placeToAdd;
  final String userRatingTotal;
  final String transformedUserRatingTotal;
  final String type;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, top: 48),
      child: SizedBox(
        width: 390,
        height: 133,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageForCardOnCollectionsListDialogPage(image: image),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 17.5),
                    child: NameLabelForCardsOnFavoritesPage(
                      place: placeToAdd,
                      color: const Color(0xffF3F0E6),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: UserRatingAndTotalRatingWidget(
                      color: const Color(0xffF3F0E6),
                      place: placeToAdd,
                      userRatingTotal: userRatingTotal,
                      transformedUserRatingTotal: transformedUserRatingTotal),
                ),
                DialogPlaceToAddTypeLabel(placeToAdd: placeToAdd, type: type),
                const SizedBox(
                  height: 24,
                ),
                DistanceLabelWidget(
                    fontSize: 12,
                    color: const Color(0xffF3F0E6),
                    distance: distance),
              ],
            )
          ],
        ),
      ),
    );
  }
}
