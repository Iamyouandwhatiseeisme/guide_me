import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../../business_layer/cubit/write_a_review_cubit.dart';
import '../../../data_layer/models/nearby_places_model.dart';

class WriteAReviewButtonWidget extends StatelessWidget {
  const WriteAReviewButtonWidget({
    super.key,
    required this.passedPlace,
  });

  final NearbyPlacesModel passedPlace;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WriteAReviewCubit, bool>(
      builder: (context, reviewed) {
        return GestureDetector(
          onTap: () {
            context
                .read<WriteAReviewCubit>()
                .openGoogleMapsReview(passedPlace.placeId);
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: TextWithUnderLine(
              textToDisplay: 'Write a review',
            ),
          ),
        );
      },
    );
  }
}