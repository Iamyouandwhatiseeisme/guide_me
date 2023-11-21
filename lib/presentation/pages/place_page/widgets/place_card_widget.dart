// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:guide_me/data/data.dart';

class PlaceCard extends StatelessWidget {
  final NearbyPlacesModel place;

  const PlaceCard({
    Key? key,
    required this.place,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String apiKey = dotenv.env['GOOGLE_API_KEY']!;
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
              'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=$apiKey',
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
