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
    return Row(
      children: [
        StarRating(rating: place.rating!),
        SizedBox(
          width: 3,
        ),
        SizedBox(
          height: 8,
          width: 1,
          child: Container(
            color: Color(0xff292F3280),
          ),
        ),
        SizedBox(
          width: 3,
        ),
        if (userRatingTotal.length >= 4)
          Text(transformedUserRatingTotal)
        else
          Text(userRatingTotal)
      ],
    );
  }
}
