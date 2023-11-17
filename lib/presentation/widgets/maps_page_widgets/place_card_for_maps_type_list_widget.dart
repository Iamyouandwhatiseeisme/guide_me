import 'package:flutter/material.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class PlaceCardForMapsTypeListWidget extends StatelessWidget {
  const PlaceCardForMapsTypeListWidget({
    Key? key,
    required this.placeToDisplay,
    required this.image,
    required this.listOfPlaces,
    required this.distance,
    required this.placeName,
  }) : super(key: key);

  final NearbyPlacesModel placeToDisplay;
  final String image;
  final List<NearbyPlacesModel> listOfPlaces;
  final double? distance;
  final String placeName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final placePagePayload = PlacePagePayLoad(model: placeToDisplay);
        Navigator.pushNamed(context, 'placePage',
            arguments: [placePagePayload]);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MapsPagePhotoWidget(image: image),
          const SizedBox(
            height: 16,
          ),
          Text(
            placeName,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.15,
                overflow: TextOverflow.ellipsis),
          ),
          DistanceLabelWidget(
            width: 17,
            height: 18,
            fontSize: 14,
            color: const Color(0xffF3F0E6),
            distance: distance,
            iconColor: const Color(0xffF3F0E6),
          )
        ],
      ),
    );
  }
}
