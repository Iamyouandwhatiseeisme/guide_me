import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class BookmarksPageCardWidget extends SightseeingsPlaceCard {
  const BookmarksPageCardWidget(
      {super.key,
      this.name,
      required this.tabOptionState,
      required this.onDelete,
      required super.place,
      required super.distance,
      required super.apiKey});

  final Function onDelete;
  final bool tabOptionState;
  final String? name;

  @override
  Widget build(BuildContext context) {
    const imageIfNoImageIsAvailable =
        'https://static.vecteezy.com/system/resources/thumbnails/022/059/000/small/no-image-available-icon-vector.jpg';
    String? photoReference = place.photos?[0]['photo_reference'];
    if (photoReference != null && place.rating != null && place.rating! > 4.0) {
      final imageIfImageIsAvailable =
          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=$apiKey';
      return CardUiForBookmarksPage(
        name: name,
        tabOptionState: tabOptionState,
        onDelete: onDelete,
        apiKey: apiKey,
        distance: distance,
        place: place,
        image: imageIfImageIsAvailable,
      );
    } else {
      return CardUiForBookmarksPage(
        name: name,
        tabOptionState: tabOptionState,
        onDelete: onDelete,
        apiKey: apiKey,
        distance: distance,
        place: place,
        image: imageIfNoImageIsAvailable,
      );
    }
  }
}
