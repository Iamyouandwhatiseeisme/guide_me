import 'package:flutter/material.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/pages/bookmarks_page.dart';
import 'package:guide_me/presentation_layer/widgets/first_page_widgets/sightseeings_place_card.wiget.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../card_ui_widget.dart';

class BookmarksPageCardWidget extends SightseeingsPlaceCard {
  BookmarksPageCardWidget(
      {super.key,
      required this.onDelete,
      required this.list,
      required super.place,
      required super.distance,
      required super.apiKey});
  late List<NearbyPlacesModel> list;
  final Function onDelete;

  @override
  Widget build(BuildContext context) {
    const imageIfNoImageIsAvailable =
        'https://static.vecteezy.com/system/resources/thumbnails/022/059/000/small/no-image-available-icon-vector.jpg';
    String? photoReference = place.photos?[0]['photo_reference'];
    if (photoReference != null && place.rating != null && place.rating! > 4.0) {
      final imageIfImageIsAvailable =
          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=$apiKey';
      return CardUiForBookmarksPage(
        onDelete: onDelete,
        list: list,
        apiKey: apiKey,
        distance: distance,
        place: place,
        image: imageIfImageIsAvailable,
      );
    } else {
      return CardUiForBookmarksPage(
        onDelete: onDelete,
        list: list,
        apiKey: apiKey,
        distance: distance,
        place: place,
        image: imageIfNoImageIsAvailable,
      );
    }
  }
}
