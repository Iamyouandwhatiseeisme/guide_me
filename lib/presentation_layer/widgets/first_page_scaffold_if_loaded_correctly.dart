import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:guide_me/business_layer/cubit/geolocator_cubit.dart';

import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_cubit.dart';

import 'package:guide_me/business_layer/cubit/what_to_visit_toggle_button_dart_cubit.dart';
import 'package:guide_me/business_layer/widgets/business_widgets.dart';

import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class FirstPageScaffoldIfLoadedCorrectly extends StatefulWidget {
  const FirstPageScaffoldIfLoadedCorrectly({
    super.key,
    required this.listOfNearbyPlaces,
    required this.listOfSightseeings,
  });

  final List<NearbyPlacesModel> listOfNearbyPlaces;
  final List<NearbyPlacesModel> listOfSightseeings;

  @override
  State<FirstPageScaffoldIfLoadedCorrectly> createState() =>
      _FirstPageScaffoldIfLoadedCorrectlyState();
}

class _FirstPageScaffoldIfLoadedCorrectlyState
    extends State<FirstPageScaffoldIfLoadedCorrectly> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF3F0E6),
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: FirstPageAppBar(),
        ),
        body: SingleChildScrollView(
            child: MultiBlocProvider(
                providers: [
              BlocProvider(
                create: (context) => WhatToVisitToggleButtonCubit(),
              ),
              BlocProvider(
                create: (context) => GeolocatorCubit(),
              ),
            ],
                child: Builder(
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
                        WhatToVisitLabelWidget(),
                        const SizedBox(
                          height: 12,
                        ),
                        BlocBuilder<WhatToVisitToggleButtonCubit,
                            WhatToVisitToggleButtonCubitInitial>(
                          builder: (context, state) {
                            return WhatToVisitRadioButtonWidget(
                              state: state,
                            );
                          },
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        BlocBuilder<WhatToVisitToggleButtonCubit,
                            WhatToVisitToggleButtonCubitInitial>(
                          builder: (context, whatTovisitstate) {
                            return BlocBuilder<GeolocatorCubit, LocationState>(
                              builder: (context, locationState) {
                                final geoLocatorCubit =
                                    BlocProvider.of<GeolocatorCubit>(context);
                                geoLocatorCubit.getLocation();
                                if (locationState is LocationLoaded) {
                                  double lat = locationState.position.latitude;
                                  double lon = locationState.position.longitude;
                                  return RecommendedSightseeingCardBuilder(
                                    listOfSightseeingPlaces:
                                        widget.listOfSightseeings,
                                    whatTovisitstate: whatTovisitstate,
                                    userLat: lat,
                                    userLon: lon,
                                    nearbySightSeeingCubit:
                                        NearbySightSeeingCubit(),
                                  );
                                } else {
                                  return CircularProgressIndicator();
                                }
                              },
                            );
                          },
                        ),
                      ],
                    );
                  },
                ))));
  }
}
