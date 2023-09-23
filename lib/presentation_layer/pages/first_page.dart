import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/recommended_places_cubit_dart_state.dart';
import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_cubit.dart';
import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_state.dart';
import 'package:guide_me/data_layer/http_helper_nearby_sightseeings.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/data_layer/data.dart';
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
  @override
  void initState() {
    super.initState();
    fetchData(listOfNearbyPlaces);
    fetchSightseeingData(listOfSightseeingPlaces);
  }

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
      ],
      child: Builder(builder: (context) {
        final nearbyPlacesCubit = context.read<NearbyPlacesCubit>();
        nearbyPlacesCubit.fetchNearbyPlaces();
        final nearbySightSeeingCubit = context.read<NearbySightSeeingCubit>();
        nearbySightSeeingCubit.fetchNearbySightseeings();
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
                              body: Center(child: CircularProgressIndicator()));
                        } else {
                          return FirstPageScaffoldIfLoadedCorrectly(
                            nearbySightSeeingCubit: nearbySightSeeingCubit,
                            listOfNearbyPlaces: listOfNearbyPlaces,
                            listOfSightseeings: listOfSightseeingPlaces,
                          );
                        }
                      }));
                },
              ),
            );
          },
        );
      }),
    );
  }
}
