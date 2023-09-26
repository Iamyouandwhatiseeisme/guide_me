// ignore_for_file: public_member_api_docs, sort_constructors_first

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
            Builder(builder: (context) {
              return Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Text(openStatusstate.props[0].toString()));
            }),
            Builder(builder: (context) {
              if (openningHours['open_hour'] != null) {
                return Text(openningHours['open_hour']!.substring(0, 2) +
                    ':' +
                    openningHours['open_hour']!.substring(2, 4) +
                    'AM -' +
                    openningHours['close_hour']!.substring(0, 2) +
                    ':' +
                    openningHours['close_hour']!.substring(2, 4) +
                    'PM');
              } else {
                return Text('No Information Available');
              }
            })
          ],
        );
      },
    );
  }
}
