import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/geolocator_cubit.dart';
import 'package:guide_me/business_layer/cubit/recommended_places_cubit_dart_state.dart';
import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_cubit.dart';
import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_state.dart';
import 'package:guide_me/business_layer/cubit/what_to_eat_cubit.dart';

import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../business_layer/cubit/recommended_places_cubit_dart_cubit.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  double latitude = 0;
  double longtitude = 0;

  List<NearbyPlacesModel> listOfNearbyPlaces = [];
  List<NearbyPlacesModel> listOfSightseeingPlaces = [];
  List<NearbyPlacesModel> listPlacesForFood = [];
  final String apiKey = 'AIzaSyDzW8mtXzGKSfoNPDrdPFbDomkmpBRGK9c';
  @override
  // void initState() {
  //   super.initState();
  //   // fetchData(listOfNearbyPlaces);
  //   // fetchSightseeingData(listOfSightseeingPlaces);

  //   // fetchPlacesForFoodData(listPlacesForFood);
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NearbyPlacesCubit(),
        ),
        BlocProvider(
          create: (context) => NearbySightSeeingCubit(),
        ),
        BlocProvider(
          create: (context) => WhatToEatCubit(),
        ),
        BlocProvider(create: (context) => GeolocatorCubit())
      ],
      child: BlocBuilder<GeolocatorCubit, LocationState>(
        builder: (context, locationState) {
          return Builder(builder: (context) {
            final geoLocatorCubit = context.read<GeolocatorCubit>();
            geoLocatorCubit.getLocation();
            if (locationState is LocationLoaded) {
              latitude = locationState.position.latitude;
              longtitude = locationState.position.longitude;
            } else {
              return Scaffold(
                body: CircularProgressIndicator(),
              );
            }
            final nearbyPlacesCubit = context.read<NearbyPlacesCubit>();
            if (listOfNearbyPlaces.isEmpty) {
              nearbyPlacesCubit.fetchNearbyPlaces(
                  listOfNearbyPlaces, apiKey, latitude, longtitude);
            }

            final nearbySightSeeingCubit =
                context.read<NearbySightSeeingCubit>();
            if (listOfSightseeingPlaces.isEmpty) {
              nearbySightSeeingCubit.fetchNearbySightseeings(
                  listOfSightseeingPlaces, apiKey, latitude, longtitude);
            }
            final whatToEatCubit = context.read<WhatToEatCubit>();
            if (listPlacesForFood.isEmpty) {
              whatToEatCubit.fetchPlacesForWhatToEat(
                  listPlacesForFood, apiKey, latitude, longtitude);
            }

            return BlocBuilder<NearbySightSeeingCubit, NearbySightseeingsState>(
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.only(top: 40),
                  child: BlocBuilder<NearbyPlacesCubit, NearbyPlacesState>(
                    builder: (context, state) {
                      if (state is NearbyPlacesLoading) {
                        return const Scaffold(
                            body: Center(child: CircularProgressIndicator()));
                      }
                      return FutureBuilder(
                          future: Future.delayed(const Duration(seconds: 2)),
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Scaffold(
                                  body: Center(
                                      child: CircularProgressIndicator()));
                            } else {
                              return FirstPageScaffoldIfLoadedCorrectly(
                                lat: latitude,
                                lon: longtitude,
                                listOfNearbyPlaces: listOfNearbyPlaces,
                                listOfSightseeings: listOfSightseeingPlaces,
                                listOfPlacesForFood: listPlacesForFood,
                                apiKey: apiKey,
                              );
                            }
                          }));
                    },
                  ),
                );
              },
            );
          });
        },
      ),
    );
  }
}
