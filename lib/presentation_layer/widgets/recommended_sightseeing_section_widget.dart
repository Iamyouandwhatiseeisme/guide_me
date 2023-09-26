import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/recommended_places_sightseeings_dart_state.dart';
import 'package:guide_me/presentation_layer/widgets/first_page_scaffold_if_loaded_correctly.dart';
import 'package:guide_me/presentation_layer/widgets/sortable_list_view_card_builder.dart';

import '../../business_layer/cubits.dart';
import '../../business_layer/widgets/what_to_visit_radio_button_widget.dart';

class RecommendedSightseeingWidget extends StatelessWidget {
  const RecommendedSightseeingWidget({
    super.key,
    required this.widget,
    required this.lat,
    required this.lon,
  });

  final FirstPageScaffoldIfLoadedCorrectly widget;
  final double lat;
  final double lon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<SorterToggleButtonCubit, SorterToggleButtonInitial>(
          builder: (context, state) {
            return SorterRadioButtonWidget(
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
        BlocBuilder<SorterToggleButtonCubit, SorterToggleButtonInitial>(
          builder: (context, whatTovisitstate) {
            return BlocBuilder<GeolocatorCubit, LocationState>(
              builder: (context, locationState) {
                return BlocBuilder<NearbySightSeeingCubit,
                    NearbySightseeingsState>(builder: (context, state) {
                  if (state is NearbySightseeingsLoaded) {
                    return SortableListViewCardBuilder(
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
  }
}
