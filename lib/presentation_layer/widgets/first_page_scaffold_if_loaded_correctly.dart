// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/geolocator_cubit.dart';
import 'package:guide_me/business_layer/cubit/sightseeing_sorting_cubit.dart';
import 'package:guide_me/business_layer/cubit/what_to_visit_toggle_button_dart_cubit.dart';
import 'package:guide_me/business_layer/widgets/business_widgets.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class FirstPageScaffoldIfLoadedCorrectly extends StatefulWidget {
  const FirstPageScaffoldIfLoadedCorrectly({
    Key? key,
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
            create: (context) => WhatToVisitToggleButtonCubit(),
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
                appBar: const PreferredSize(
                  preferredSize: Size.fromHeight(48),
                  child: FirstPageAppBar(),
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
                                listOfNearbyPlaces: widget.listOfNearbyPlaces),
                            const SizedBox(
                              height: 48,
                            ),
                            const WhatToVisitLabelWidget(),
                            const SizedBox(
                              height: 12,
                            ),
                            BlocBuilder<WhatToVisitToggleButtonCubit,
                                WhatToVisitToggleButtonCubitInitial>(
                              builder: (context, state) {
                                return WhatToVisitRadioButtonWidget(
                                  userLat: lat,
                                  userLon: lon,
                                  listOfSightseeings: widget.listOfSightseeings,
                                  state: state,
                                );
                              },
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            RecommendedSightseeingWidget(
                                widget: widget, lat: lat, lon: lon),
                            const SizedBox(
                              height: 25,
                            ),
                            MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create: (context) =>
                                      SightseeingSortingCubit(),
                                ),
                                BlocProvider(
                                  create: (context) =>
                                      WhatToVisitToggleButtonCubit(),
                                ),
                              ],
                              child: Builder(builder: (context) {
                                return BlocBuilder<WhatToVisitToggleButtonCubit,
                                    WhatToVisitToggleButtonCubitInitial>(
                                  builder: (context, state) {
                                    return Column(
                                      children: [
                                        WhatToVisitRadioButtonWidget(
                                            userLat: lat,
                                            userLon: lon,
                                            listOfSightseeings:
                                                widget.listOfPlacesForFood,
                                            state: state),
                                        SortableListViewCardBuilder(
                                            userLat: lat,
                                            userLon: lon,
                                            listOfPassedPlaces:
                                                widget.listOfPlacesForFood),
                                      ],
                                    );
                                  },
                                );
                              }),
                            )
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
