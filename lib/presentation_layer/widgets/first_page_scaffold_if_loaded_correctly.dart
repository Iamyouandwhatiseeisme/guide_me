// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/geolocator_cubit.dart';
import 'package:guide_me/business_layer/cubit/sightseeing_sorting_cubit.dart';
import 'package:guide_me/business_layer/cubit/sorter_toggle_button_cubit.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class FirstPageScaffoldIfLoadedCorrectly extends StatefulWidget {
  final String apiKey;
  const FirstPageScaffoldIfLoadedCorrectly({
    Key? key,
    required this.apiKey,
    required this.listOfPlacesForFood,
    required this.listOfNearbyPlaces,
    required this.listOfSightseeings,
  }) : super(key: key);
  final List<NearbyPlacesModel> listOfPlacesForFood;
  final List<NearbyPlacesModel> listOfNearbyPlaces;
  final List<NearbyPlacesModel> listOfSightseeings;

  @override
  State<FirstPageScaffoldIfLoadedCorrectly> createState() =>
      _FirstPageScaffoldIfLoadedCorrectlyState();
}

class _FirstPageScaffoldIfLoadedCorrectlyState
    extends State<FirstPageScaffoldIfLoadedCorrectly> {
  bool _locationLoaded = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SorterToggleButtonCubit(),
          ),
          BlocProvider(
            create: (context) => GeolocatorCubit(),
          ),
          BlocProvider(create: (context) => SightseeingSortingCubit())
        ],
        child: BlocBuilder<GeolocatorCubit, LocationState>(
          builder: (context, state) {
            if (!_locationLoaded) {
              final geoLocatorCubit = BlocProvider.of<GeolocatorCubit>(context);
              geoLocatorCubit.getLocation();

              _locationLoaded = true;
            }
            return Scaffold(
                backgroundColor: const Color(0xffF3F0E6),
                appBar: PreferredSize(
                  preferredSize: const Size.fromHeight(48),
                  child: FirstPageAppBar(
                    apiKey: widget.apiKey,
                  ),
                ),
                body: SingleChildScrollView(child:
                    BlocBuilder<GeolocatorCubit, LocationState>(
                        builder: (context, locationState) {
                  if (locationState is LocationLoaded) {
                    double lat = locationState.position.latitude;
                    double lon = locationState.position.longitude;

                    return Builder(
                      builder: (context) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SearchTextFieldWIdget(),
                            const SizedBox(
                              height: 24,
                            ),
                            const RecommendedWidget(),
                            const SizedBox(
                              height: 12,
                            ),
                            RecommenPlacesCardBuilder(
                                apiKey: widget.apiKey,
                                listOfNearbyPlaces: widget.listOfNearbyPlaces),
                            const SizedBox(
                              height: 48,
                            ),
                            const LabelWIthCaregoryTypeNameAndSeeAllRow(
                              textToDisplay: 'What to visit',
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            RecommendedSightseeingWidget(
                                apiKey: widget.apiKey,
                                widget: widget,
                                lat: lat,
                                lon: lon),
                            const SizedBox(
                              height: 25,
                            ),
                            WhatToEatWidget(
                                apiKey: widget.apiKey,
                                lat: lat,
                                lon: lon,
                                widget: widget)
                          ],
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                })));
          },
        ));
  }
}
