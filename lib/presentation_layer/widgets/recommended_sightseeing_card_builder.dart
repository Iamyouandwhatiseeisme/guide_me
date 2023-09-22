// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_cubit.dart';
import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_state.dart';

import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../business_layer/cubit/what_to_visit_toggle_button_dart_cubit.dart';

class RecommendedSightseeingCardBuilder extends StatelessWidget {
  final List<NearbyPlacesModel> listOfSightseeingPlaces;
  final NearbySightSeeingCubit nearbySightSeeingCubit;
  final WhatToVisitToggleButtonCubitInitial state;

  const RecommendedSightseeingCardBuilder({
    Key? key,
    required this.listOfSightseeingPlaces,
    required this.nearbySightSeeingCubit,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<NearbySightSeeingCubit>(context).state
        is NearbySightseeingsLoaded) {
      // Sort the list based on the cubit state

      List<NearbyPlacesModel> sortedList = List.from(listOfSightseeingPlaces);

      switch (state.value) {
        case 0:
          sortedList.sort((a, b) {
            // Implement your custom sorting logic for budget-friendly
            // Compare a and b and return -1, 0, or 1 based on your logic.
            final aPriceLevel = a.priceLevel ?? 0;
            final bPriceLevel = b.priceLevel ?? 0;
            return aPriceLevel.compareTo(bPriceLevel);
          });
          break;
        case 1:
          sortedList.sort((a, b) {
            final aRating = a.rating ?? 0;
            final bRating = b.rating ?? 0;
            // Implement your custom sorting logic for highest rated
            // Compare a and b and return -1, 0, or 1 based on your logic.
            return bRating.compareTo(aRating); // Sort in descending order
          });
          break;
        case 2:
          // Implement your custom sorting logic for closest to you
          // Compare a and b and return -1, 0, or 1 based on your logic.
          break;
      }

      // Now, build the UI using the sorted list
      return Container(
        color: Colors.white,
        width: 430,
        height: 150,
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: sortedList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10, right: 24),
                  child: SizedBox(
                    height: 140,
                    width: 160,
                    child: PlaceCard(
                      place: sortedList[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
    } else if (BlocProvider.of<NearbySightSeeingCubit>(context).state
        is NearbySightseeingsLoading) {
      // Handle other states or loading state here

      return const CircularProgressIndicator(
        color: Colors.black,
      );
    } else {
      print('error');
      return const CircularProgressIndicator(
        color: Colors.black38,
      );
    }
  }
}
