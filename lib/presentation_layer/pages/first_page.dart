import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/recommended_places_cubit_dart_state.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../business_layer/cubit/recommended_places_cubit_dart_cubit.dart';

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  List<NearbyPlacesModel> listOfNearbyPlaces = [];
  @override
  void initState() {
    super.initState();
    fetchData(listOfNearbyPlaces);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NearbyPlacesCubit(),
      child: Builder(builder: (context) {
        final nearbyPlacesCubit = context.read<NearbyPlacesCubit>();
        nearbyPlacesCubit.fetchNearbyPlaces();
        return Container(
          padding: const EdgeInsets.only(top: 40),
          child: BlocBuilder<NearbyPlacesCubit, NearbyPlacesState>(
            builder: (context, state) {
              if (state is NearbyPlacesLoading) {
                return const Scaffold(
                    body: Center(child: CircularProgressIndicator()));
              }
              return FutureBuilder(
                  future: Future.delayed(const Duration(seconds: 3)),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Scaffold(
                          body: Center(child: CircularProgressIndicator()));
                    } else {
                      return FirstPageScaffoldIfLoadedCorrectly(
                          listOfNearbyPlaces: listOfNearbyPlaces);
                    }
                  }));
            },
          ),
        );
      }),
    );
  }
}
