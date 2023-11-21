import 'package:flutter/material.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class TransformedUserRatingWIdget extends StatelessWidget {
  const TransformedUserRatingWIdget({
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
    return Padding(
      padding: const EdgeInsets.only(left: 45),
      child: SizedBox(
        child: Transform.scale(
          scale: 1.5,
          child: UserRatingAndTotalRatingWidget(
              color: Colors.black,
              place: passedPlace,
              userRatingTotal: userRatingTotal,
              transformedUserRatingTotal: transformedUserRatingTotal),
        ),
      ),
    );
  }
}
