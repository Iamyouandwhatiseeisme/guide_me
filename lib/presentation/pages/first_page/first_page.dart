// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';

import 'package:guide_me/data/data.dart';

import 'package:guide_me/main.dart';

import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final googleApiClient = sl<GoogleDataSource>();

  List<NearbyPlacesModel> listOfNearbyPlaces = [];
  List<NearbyPlacesModel> listOfSightseeingPlaces = [];
  List<NearbyPlacesModel> listPlacesForFood = [];
  late UserLocation userLocation;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NearbyPlacesCubit()
            ..fetchNearbyPlaces(
                listOfNearbyPlaces: listOfNearbyPlaces,
                googleApiClient: googleApiClient),
        ),
        BlocProvider(
          create: (context) => NearbySightSeeingCubit()
            ..fetchNearbySightseeings(
                listOfNearbySightseeings: listOfSightseeingPlaces,
                googleApiClient: googleApiClient),
        ),
        BlocProvider(
          create: (context) => WhatToEatCubit()
            ..fetchPlacesForWhatToEat(
                listOfPlacesForFood: listPlacesForFood,
                googleApiClient: googleApiClient),
        ),
        BlocProvider(create: (context) => FetchSearchedItemsCubit()),
      ],
      child: BlocBuilder<GeolocatorCubit, LocationState>(
        builder: (context, locationState) {
          return Builder(builder: (context) {
            // final geoLocatorCubit = context.read<GeolocatorCubit>();
            // geoLocatorCubit.getLocation();

            if (locationState is LocationLoaded) {
              // final userLocation = UserLocation(
              //     userLat: locationState.position.latitude,
              //     userLon: locationState.position.longitude);
              // registerLocationSingleton(userLocation);

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
                          return BlocBuilder<WhatToEatCubit, WhatToEatState>(
                            builder: (context, state) {
                              if (state is! WhatToEatLoaded) {
                                return const LoadingAnimationScaffold();
                              } else {
                                return FirstPageContent(
                                  listOfNearbyPlaces: listOfNearbyPlaces,
                                  listOfSightseeings: listOfSightseeingPlaces,
                                  listOfPlacesForFood: listPlacesForFood,
                                );
                              }
                            },
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
}
