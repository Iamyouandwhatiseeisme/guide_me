import 'package:flutter/widgets.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/star_rating_widget.dart';

class UserRatingAndTotalRatingWidget extends StatelessWidget {
  const UserRatingAndTotalRatingWidget({
    super.key,
    required this.color,
    required this.place,
    required this.userRatingTotal,
    required this.transformedUserRatingTotal,
  });
  final Color color;
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
            height: 10,
            width: 1,
            child: Container(
              color: color,
            ),
          ),
          const SizedBox(
            width: 3,
          ),
          Text(
              userRatingTotal.length >= 4
                  ? transformedUserRatingTotal
                  : userRatingTotal,
              style: TextStyle(color: color)),
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
