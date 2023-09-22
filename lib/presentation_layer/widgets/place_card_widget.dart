import 'package:flutter/material.dart';

import '../../data_layer/models/nearby_places_model.dart';

class PlaceCard extends StatelessWidget {
  final NearbyPlacesModel place;

  const PlaceCard({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    String? photoReference = place.photos?[0]['photo_reference'];
    if (photoReference != null && place.rating != null && place.rating! > 4.0) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 106,
            width: 160,
            child: Image.network(
              'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=AIzaSyDFwz7Nk7baEraJxw-23Wc68rdeib0eTzQ',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            place.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 106,
            width: 160,
            child: Image.network(
              'https://static.vecteezy.com/system/resources/thumbnails/022/059/000/small/no-image-available-icon-vector.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Text(
            place.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      );
    }
  }
}
