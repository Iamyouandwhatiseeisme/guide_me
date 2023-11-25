import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        TextButton(
            label: AppLocalizations.of(context)!.writeAReview,
            onTap: () {
              context
                  .read<WriteAReviewCubit>()
                  .openGoogleMapsReview(passedPlace.placeId);
            }),
      ],
    );
  }
}
