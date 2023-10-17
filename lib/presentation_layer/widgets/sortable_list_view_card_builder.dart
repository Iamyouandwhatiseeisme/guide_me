// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/sightseeing_sorting_cubit.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../business_layer/cubit/sorter_toggle_button_cubit.dart';

class SortableListViewCardBuilder extends StatelessWidget {
  final List<NearbyPlacesModel> listOfPassedPlaces;
  final String apiKey;
  final double userLat;
  final double userLon;

  const SortableListViewCardBuilder({
    Key? key,
    required this.listOfPassedPlaces,
    required this.apiKey,
    required this.userLat,
    required this.userLon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<NearbyPlacesModel> sortedList = List.from(listOfPassedPlaces);
    Map<NearbyPlacesModel, double?> distanceMap = {};

    return BlocBuilder<SightseeingSortingCubit, SightseeingSortingState>(
      builder: (context, sightseeingSortingState) {
        return Builder(builder: (context) {
          return BlocBuilder<SorterToggleButtonCubit, SortertoggleButtonState>(
              builder: (context, state) {
            final sightseeingSortingCubit =
                BlocProvider.of<SightseeingSortingCubit>(context);
            sightseeingSortingCubit.sortList(
                sortedList, state.value, userLat, userLon, distanceMap);
            final box = Hive.box<NearbyPlacesModel>('FavoritedPlaces');
            // Now, build the UI using the sorted list
            return SizedBox(
              width: 430,
              height: 300,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 300,
                  child: ValueListenableBuilder(
                      valueListenable: box.listenable(),
                      builder: (context, value, child) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sortedList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                top: 10,
                              ),
                              child: SizedBox(
                                height: 280,
                                width: 250,
                                child: GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    'placePage',
                                    arguments: [apiKey, sortedList[index]],
                                  ),
                                  child: Stack(children: [
                                    SightseeingsPlaceCard(
                                      apiKey: apiKey,
                                      distance: distanceMap[sortedList[index]],
                                      place: sortedList[index],
                                    ),
                                    Positioned(
                                        top: 10,
                                        right: 10,
                                        child: Container(
                                            width: 36,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(32),
                                              color: const Color(0xffF3F0E6)
                                                  .withAlpha(40),
                                            ),
                                            child: FavoriteButton(
                                                color: const Color(0xffF3F0E6),
                                                placeToDisplay:
                                                    sortedList[index],
                                                box: box)))
                                  ]),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ),
              ),
            );
          });
        });
      },
    );
  }
}
