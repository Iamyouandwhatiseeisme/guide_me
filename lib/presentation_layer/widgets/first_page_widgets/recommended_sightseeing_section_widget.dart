// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_state.dart';
import 'package:guide_me/presentation_layer/widgets/first_page_scaffold_if_loaded_correctly.dart';
import 'package:guide_me/presentation_layer/widgets/sortable_list_view_card_builder.dart';

import '../../../business_layer/cubits.dart';
import '../../../business_layer/widgets/sorter_radio_button_widget.dart';

class RecommendedSightseeingsSectiogWidget extends StatelessWidget {
  final String apiKey;
  const RecommendedSightseeingsSectiogWidget({
    Key? key,
    required this.apiKey,
    required this.widget,
    required this.lat,
    required this.lon,
  }) : super(key: key);

  final FirstPageScaffoldIfLoadedCorrectly widget;
  final double lat;
  final double lon;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SightseeingSortingCubit(),
        ),
        BlocProvider(
          create: (context) => SorterToggleButtonCubit(),
        ),
      ],
      child: Builder(builder: (context) {
        return Column(
          children: [
            BlocBuilder<SorterToggleButtonCubit, SortertoggleButtonState>(
              builder: (context, state) {
                return SorterRadioButtonWidget(
                  userLat: lat,
                  userLon: lon,
                  state: state,
                );
              },
            ),
            const SizedBox(
              height: 12,
            ),
            BlocBuilder<SorterToggleButtonCubit, SortertoggleButtonState>(
              builder: (context, whatTovisitstate) {
                return BlocBuilder<GeolocatorCubit, LocationState>(
                  builder: (context, locationState) {
                    return BlocBuilder<NearbySightSeeingCubit,
                        NearbySightseeingsState>(builder: (context, state) {
                      if (state is NearbySightseeingsLoaded) {
                        return SortableListViewCardBuilder(
                          apiKey: apiKey,
                          listOfPassedPlaces: widget.listOfSightseeings,
                          userLat: lat,
                          userLon: lon,
                        );
                      } else if (state is NearbySightseeingsLoading) {
                        // Handle other states or loading state here

                        return const CircularProgressIndicator(
                          color: Colors.black,
                        );
                      } else {
                        return const CircularProgressIndicator.adaptive();
                      }
                    });
                  },
                );
              },
            ),
          ],
        );
      }),
    );
  }
}
