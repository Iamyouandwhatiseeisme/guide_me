// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class PlacePageContet extends StatelessWidget {
  const PlacePageContet({
    Key? key,
    required this.openningHours,
    required this.passedPlace,
    required this.userRatingTotal,
    required this.transformedUserRatingTotal,
    required this.typesInString,
    required this.number,
    required this.adress,
  }) : super(key: key);
  final Map<String, String?> openningHours;
  final NearbyPlacesModel passedPlace;
  final String userRatingTotal;
  final String transformedUserRatingTotal;
  final String typesInString;
  final String? number;
  final String? adress;

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
                typesInString: typesInString, number: number),
            AdressLabelAndOpenInMapButtonRowWIdget(
                adress: adress, passedPlace: passedPlace),
            OpenStatusLabelWidget(openStatus: openStatus),
            OpenHoursInfoWidget(openningHours: openningHours)
          ],
        );
      },
    );
  }
}
