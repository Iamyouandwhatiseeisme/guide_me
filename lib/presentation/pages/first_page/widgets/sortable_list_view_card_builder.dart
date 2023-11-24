// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubit/fetched_place_details_formatter_cubit.dart';
import 'package:guide_me/bloc/cubits.dart';

import 'package:guide_me/data/data.dart';

import 'package:guide_me/main.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../widgets/navigation/navigator_client.dart';
import '../../../widgets/presentation_layer_widgets.dart';

class SortableListViewCardBuilder extends StatefulWidget {
  final List<NearbyPlacesModel> listOfPassedPlaces;
  final Map<NearbyPlacesModel, double?> distanceMap;

  const SortableListViewCardBuilder({
    Key? key,
    required this.listOfPassedPlaces,
    required this.distanceMap,
  }) : super(key: key);

  @override
  State<SortableListViewCardBuilder> createState() =>
      _SortableListViewCardBuilderState();
}

class _SortableListViewCardBuilderState
    extends State<SortableListViewCardBuilder> {
  @override
  Widget build(BuildContext context) {
    final sortingCubit = BlocProvider.of<SortingCubit>(context);

    final UserLocation userLocation = sl.get<UserLocation>();
    final box = Hive.box<NearbyPlacesModel>('FavoritedPlaces');
    return BlocProvider(
      create: (context) => FetchedPlaceDetailsFormatterCubit(),
      child: BlocListener<SorterToggleButtonCubit, SorterToggleButtonState>(
          listener: (context, sortingState) {
        if (sortingState.sorterState == SortingOption.byRating) {
          sortingCubit.sortList(
              unsortedList: widget.listOfPassedPlaces,
              sortingOption: sortingState.sorterState!,
              userLocation: userLocation,
              distanceMap: widget.distanceMap);
        }
        if (sortingState.sorterState == SortingOption.byDistance) {
          sortingCubit.sortList(
              unsortedList: widget.listOfPassedPlaces,
              sortingOption: sortingState.sorterState!,
              userLocation: userLocation,
              distanceMap: widget.distanceMap);
        }
      }, child: Builder(builder: (context) {
        return BlocBuilder<SortingCubit, SortingState>(
          builder: (context, state) {
            return Container(
              width: 430,
              height: 300,
              color: Theme.of(context).colorScheme.primary,
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 300,
                  child: ValueListenableBuilder(
                      valueListenable: box.listenable(),
                      builder: (context, value, child) {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.listOfPassedPlaces.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, top: 10),
                                child: Container(
                                  color: Theme.of(context).colorScheme.primary,
                                  height: 280,
                                  width: 250,
                                  child: GestureDetector(
                                    onTap: () {
                                      final placePagePayLoad = PlacePagePayLoad(
                                          model:
                                              widget.listOfPassedPlaces[index]);
                                      Navigator.pushNamed(
                                        context,
                                        NavigatorClient.placePage,
                                        arguments: placePagePayLoad,
                                      );
                                    },
                                    child: Stack(children: [
                                      SightseeingsPlaceCard(
                                        distance: widget.distanceMap[
                                            widget.listOfPassedPlaces[index]],
                                        place: widget.listOfPassedPlaces[index],
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
                                                  placeToDisplay:
                                                      widget.listOfPassedPlaces[
                                                          index],
                                                  box: box)))
                                    ]),
                                  ),
                                ),
                              );
                            });
                      }),
                ),
              ),
            );
          },
        );
      })),
    );
  }
}
