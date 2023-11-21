// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/geolocator_cubit.dart';
import 'package:guide_me/business_layer/cubit/recommended_places_cubit_dart_state.dart';
import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_cubit.dart';
import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_state.dart';
import 'package:guide_me/business_layer/cubit/what_to_eat_cubit.dart';
import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/main.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../business_layer/cubit/fetch_searched_items_cubit.dart';
import '../../business_layer/cubit/recommended_places_cubit_dart_cubit.dart';
import '../../data_layer/httpClients/google_api_client.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final googleApiClient = sl<GoogleApiClient>();

  List<NearbyPlacesModel> listOfNearbyPlaces = [];
  List<NearbyPlacesModel> listOfSightseeingPlaces = [];
  List<NearbyPlacesModel> listPlacesForFood = [];

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
        BlocProvider(create: (context) => FetchSearchedItemsCubit()),
        BlocProvider(create: (context) => GeolocatorCubit())
      ],
      child: BlocBuilder<GeolocatorCubit, LocationState>(
        builder: (context, locationState) {
          return Builder(builder: (context) {
            final geoLocatorCubit = context.read<GeolocatorCubit>();
            geoLocatorCubit.getLocation();

            if (locationState is LocationLoaded) {
              _initalizeFirstPageData(locationState, context);
              return BlocBuilder<NearbySightSeeingCubit,
                  NearbySightseeingsState>(
                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.only(top: 40),
                    child: BlocBuilder<NearbyPlacesCubit, NearbyPlacesState>(
                      builder: (context, state) {
                        if (state is NearbyPlacesLoading ||
                            state is NearbyPlacesInitial) {
                          return const LoadingAnimationScaffold();
                        } else if (state is NearbyPlacesError) {
                          return Scaffold(
                            body: Center(child: Text(state.errorMessage)),
                          );
                        } else {
                          return FirstPageContent(
                            listOfNearbyPlaces: listOfNearbyPlaces,
                            listOfSightseeings: listOfSightseeingPlaces,
                            listOfPlacesForFood: listPlacesForFood,
                          );
                        }
                      },
                    ),
                  );
                },
              );
            } else if (locationState is LocationErorr) {
              return Scaffold(
                  body: Center(
                child: Text(locationState.message),
              ));
            } else {
              return const LoadingAnimationScaffold();
            }
          });
        },
      ),
    );
  }

  void _initalizeFirstPageData(
      LocationLoaded locationState, BuildContext context) {
    final userLocation = UserLocation(
        userLat: locationState.position.latitude,
        userLon: locationState.position.longitude);
    registerLocationSingleton(userLocation);

    final nearbyPlacesCubit = context.read<NearbyPlacesCubit>();
    if (listOfNearbyPlaces.isEmpty) {
      nearbyPlacesCubit.fetchNearbyPlaces(
          listOfNearbyPlaces: listOfNearbyPlaces,
          googleApiClient: googleApiClient);
    }

    final nearbySightSeeingCubit = context.read<NearbySightSeeingCubit>();
    if (listOfSightseeingPlaces.isEmpty) {
      nearbySightSeeingCubit.fetchNearbySightseeings(
          listOfNearbySightseeings: listOfSightseeingPlaces,
          googleApiClient: googleApiClient);
    }
    final whatToEatCubit = context.read<WhatToEatCubit>();
    if (listPlacesForFood.isEmpty) {
      whatToEatCubit.fetchPlacesForWhatToEat(
          listOfpLacesForWhatToEat: listPlacesForFood,
          googleApiClient: googleApiClient);
    }
  }
}
