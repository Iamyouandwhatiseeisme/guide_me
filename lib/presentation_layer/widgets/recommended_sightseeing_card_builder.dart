// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_cubit.dart';
import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_state.dart';
import 'package:guide_me/business_layer/cubit/sightseeing_sorting_cubit.dart';

import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../business_layer/cubit/what_to_visit_toggle_button_dart_cubit.dart';

class RecommendedSightseeingCardBuilder extends StatelessWidget {
  final List<NearbyPlacesModel> listOfSightseeingPlaces;
  final NearbySightSeeingCubit nearbySightSeeingCubit;
  final WhatToVisitToggleButtonCubitInitial whatTovisitstate;
  final double userLat;
  final double userLon;

  const RecommendedSightseeingCardBuilder({
    Key? key,
    required this.listOfSightseeingPlaces,
    required this.nearbySightSeeingCubit,
    required this.whatTovisitstate,
    required this.userLat,
    required this.userLon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NearbyPlacesModel> sortedList = List.from(listOfSightseeingPlaces);
    Map<NearbyPlacesModel, double?> distanceMap = {};

    return BlocBuilder<NearbySightSeeingCubit, NearbySightseeingsState>(
        builder: (context, nearbySightseeingsState) {
      if (nearbySightseeingsState is NearbySightseeingsLoaded) {
        return BlocBuilder<SightseeingSortingCubit, SightseeingSortingState>(
          builder: (context, sightseeingSortingState) {
            return Builder(builder: (context) {
              return BlocBuilder<WhatToVisitToggleButtonCubit,
                      WhatToVisitToggleButtonCubitInitial>(
                  builder: (context, state) {
                final sightseeingSortingCubit =
                    BlocProvider.of<SightseeingSortingCubit>(context);
                sightseeingSortingCubit.sortList(
                    sortedList, state.value, userLat, userLon, distanceMap);

                // Now, build the UI using the sorted list
                return SizedBox(
                  width: 430,
                  height: 300,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      height: 300,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: sortedList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              top: 10,
                            ),
                            child: SizedBox(
                              height: 280,
                              width: 250,
                              child: GestureDetector(
                                onTap: () => Navigator.pushNamed(
                                    context, 'placePage',
                                    arguments: sortedList[index]),
                                child: SightseeingsPlaceCard(
                                  distance: distanceMap[sortedList[index]],
                                  place: sortedList[index],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              });
            });
          },
        );
      } else if (nearbySightseeingsState is NearbySightseeingsLoading) {
        // Handle other states or loading state here

        return const CircularProgressIndicator(
          color: Colors.black,
        );
      } else {
        return const CircularProgressIndicator.adaptive();
      }
    });
  }
}
