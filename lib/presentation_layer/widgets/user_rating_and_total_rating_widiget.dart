import 'package:flutter/widgets.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/star_rating_widget.dart';

class UserRatingAndTotalRatingWidget extends StatelessWidget {
  const UserRatingAndTotalRatingWidget({
    super.key,
    required this.place,
    required this.userRatingTotal,
    required this.transformedUserRatingTotal,
  });

  final NearbyPlacesModel place;
  final String userRatingTotal;
  final String transformedUserRatingTotal;

  @override
  Widget build(BuildContext context) {
    if (place.rating != null) {
      return Row(
        children: [
          StarRating(rating: place.rating!),
          const SizedBox(
            width: 3,
          ),
          SizedBox(
            height: 8,
            width: 1,
            child: Container(
              color: const Color(0xff292f32),
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          if (userRatingTotal.length >= 4)
            Text(transformedUserRatingTotal)
          else
            Text(userRatingTotal)
        ],
      );
    } else {
      return const Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Text('No Rating Available'),
      );
    }
  }
}
