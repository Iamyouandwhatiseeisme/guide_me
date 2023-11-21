// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class PlacePageContet extends StatelessWidget {
  const PlacePageContet({
    Key? key,
    required this.passedPlace,
    required this.userRatingTotal,
    required this.transformedUserRatingTotal,
    required this.typesInString,
    required this.placeDetails,
  }) : super(key: key);
  final PlaceDetails placeDetails;
  final NearbyPlacesModel passedPlace;
  final String userRatingTotal;
  final String transformedUserRatingTotal;
  final String typesInString;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlaceOpenStatuslabelCubit, PlaceOpenStatusLabelState>(
      builder: (context, openStatusstate) {
        String openStatus = openStatusstate.props[0].toString();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PhotoListViewBuilder(),
            NameOfThePlaceLabel(passedPlace: passedPlace),
            const SizedBox(
              height: 18,
            ),
            RatingAndReviewRowWidget(
                passedPlace: passedPlace,
                userRatingTotal: userRatingTotal,
                transformedUserRatingTotal: transformedUserRatingTotal),
            TypesLabelAndMakeACallButtonWidgetRow(
                typesInString: typesInString, number: placeDetails.number),
            AdressLabelAndOpenInMapButtonRowWIdget(
                adress: placeDetails.adress, passedPlace: passedPlace),
            OpenStatusLabelWidget(openStatus: openStatus),
            OpenHoursInfoWidget(openningHours: {
              'open_hour': placeDetails.openHour,
              'close_hour': placeDetails.closeHour
            })
          ],
        );
      },
    );
  }
}
