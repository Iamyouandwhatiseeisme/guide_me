// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../../data_layer/models/nearby_places_model.dart';

class SightseeingsPlaceCard extends StatelessWidget {
  final NearbyPlacesModel place;
  final double? distance;
  final String apiKey;

  const SightseeingsPlaceCard({
    Key? key,
    required this.place,
    required this.distance,
    required this.apiKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const imageIfNoImageIsAvailable =
        'https://static.vecteezy.com/system/resources/thumbnails/022/059/000/small/no-image-available-icon-vector.jpg';
    String? photoReference = place.photos?[0]['photo_reference'];
    if (photoReference != null && place.rating != null && place.rating! > 4.0) {
      final imageIfImageIsAvailable =
          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=$apiKey';
      return CardUi(
        distance: distance,
        place: place,
        image: imageIfImageIsAvailable,
      );
    } else {
      return CardUi(
        distance: distance,
        place: place,
        image: imageIfNoImageIsAvailable,
      );
    }
  }
}
