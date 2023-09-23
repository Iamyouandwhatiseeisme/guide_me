// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:guide_me/presentation_layer/widgets/star_rating_widget.dart';

class CardUi extends StatelessWidget {
  final double? distance;
  final String image;
  const CardUi({
    Key? key,
    required this.distance,
    required this.image,
    required this.place,
  }) : super(key: key);

  final NearbyPlacesModel place;

  @override
  Widget build(BuildContext context) {
    String userRatingTotal = place.userRatingsTotal.toString();
    String transformedUserRatingTotal =
        '${userRatingTotal.substring(0, 1)},${userRatingTotal.substring(1)}';

    String type = '';

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(3)),
      width: 256,
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SIghtseeingPhotoAndNameWidget(image: image),
          Text(
            place.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
          ),
          if (place.rating != null && place.userRatingsTotal != null)
            UserRatingAndTotalRatingWidget(
                place: place,
                userRatingTotal: userRatingTotal,
                transformedUserRatingTotal: transformedUserRatingTotal)
          else
            const Row(
              children: [Text('No Rating Available')],
            ),
          if (place.types.isNotEmpty)
            Wrap(
              children: [
                ...List.generate(place.types.length, (index) {
                  if (index < place.types.length - 1) {
                    type =
                        "${place.types[index].toString()[0].toUpperCase()}${place.types[index].toString().substring(1)}, ";
                    type = swapUnderScoreWithSpace(type);
                  } else {
                    type =
                        "${place.types.last.toString()[0].toUpperCase()}${place.types.last.toString().substring(1)}";
                    type = swapUnderScoreWithSpace(type);
                  }
                  return Text(
                    type,
                    maxLines: 2,
                    softWrap: true,
                  );
                }),
              ],
            ),
          Wrap(children: [
            Image.asset("assets/images/Distance.png"),
            SizedBox(
              width: 5,
            ),
            Text(
              "${distance.toString()} Km. away from you",
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff292F32BF)),
            ),
          ])
        ],
      ),
    );
  }
}
