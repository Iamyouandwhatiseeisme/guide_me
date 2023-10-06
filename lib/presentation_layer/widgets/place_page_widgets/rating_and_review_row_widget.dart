import 'package:flutter/widgets.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../data_layer/models/nearby_places_model.dart';

class RatingAndReviewRowWidget extends StatelessWidget {
  const RatingAndReviewRowWidget({
    super.key,
    required this.passedPlace,
    required this.userRatingTotal,
    required this.transformedUserRatingTotal,
  });

  final NearbyPlacesModel passedPlace;
  final String userRatingTotal;
  final String transformedUserRatingTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TransformedUserRatingWIdget(
            passedPlace: passedPlace,
            userRatingTotal: userRatingTotal,
            transformedUserRatingTotal: transformedUserRatingTotal),
        WriteAReviewButtonWidget(passedPlace: passedPlace)
      ],
    );
  }
}
