import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guide_me/presentation/pages/place_page/widgets/text_with_underline_grey_widget.dart';

import '../../../business_layer/cubit/write_a_review_cubit.dart';

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
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: TextWithUnderLine(
              color: const Color(0xff292F32).withOpacity(0.75),
              textToDisplay: AppLocalizations.of(context)!.writeAReview,
            ),
          ),
        );
      },
    );
  }
}
