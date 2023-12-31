// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubit/fetched_place_details_formatter_cubit.dart';
import 'package:guide_me/data/data.dart';

import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class CardUi extends StatelessWidget {
  final double? distance;
  final String image;
  const CardUi({
    Key? key,
    required this.distance,
    required this.image,
    required this.place,
  }) : super(key: key);

  final NearbyPlacesModel place;

  @override
  Widget build(BuildContext context) {
    String userRatingTotal = place.userRatingsTotal.toString();
    String transformedUserRatingTotal =
        '${userRatingTotal.substring(0, 1)},${userRatingTotal.substring(1)}';
    final FetchedPlaceDetailsFormatterCubit fetchedPlaceDetailsFormatterCubit =
        BlocProvider.of<FetchedPlaceDetailsFormatterCubit>(context);
    String type = '';

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(3)),
      width: 256,
      height: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SIghtseeingPhotoAndNameWidget(image: image),
          Text(
            place.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
          ),
          if (place.rating != null && place.userRatingsTotal != null)
            UserRatingAndTotalRatingWidget(
                color: Colors.black,
                place: place,
                userRatingTotal: userRatingTotal,
                transformedUserRatingTotal: transformedUserRatingTotal)
          else
            const Row(
              children: [Text('No Rating Available')],
            ),
          if (place.types.isNotEmpty)
            Wrap(
              children: [
                ...List.generate(place.types.length, (index) {
                  type = fetchedPlaceDetailsFormatterCubit.createListOfTypes(
                      index: index, type: type, place: place);
                  return Text(
                    type,
                    maxLines: 2,
                    softWrap: true,
                  );
                }),
              ],
            ),
          DistanceLabelWidget(
            fontSize: 12,
            distance: distance,
            color: const Color(0xff292f32),
          )
        ],
      ),
    );
  }
}
