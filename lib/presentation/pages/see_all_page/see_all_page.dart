// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubit/fetched_place_details_formatter_cubit.dart';
import 'package:guide_me/bloc/cubits.dart';

import 'package:guide_me/data/data.dart';

import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  List<NearbyPlacesModel>? listTobuild;

  SortingCubit? sightseeingSortingCubit;
  SorterToggleButtonCubit? sorterToggleButtonCubit;
  SorterRadioButtonWidget? sorterRadioButtonWidget;

  Map<NearbyPlacesModel, double?> distanceMap = {};

  @override
  Widget build(BuildContext context) {
    final seeAllPagePayload =
        ModalRoute.of(context)!.settings.arguments as SeeAllPagePayload;
    listTobuild = seeAllPagePayload.listToBuild;

    final userLocation = seeAllPagePayload.userLocation;
    sightseeingSortingCubit = seeAllPagePayload.sortingCubit;
    sorterToggleButtonCubit = seeAllPagePayload.sorterToggleButtonCubit;
    distanceMap = seeAllPagePayload.distanceMap;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: sightseeingSortingCubit!,
        ),
        BlocProvider.value(
          value: sorterToggleButtonCubit!,
        ),
        BlocProvider(create: (context) => FetchedPlaceDetailsFormatterCubit())
      ],
      child: Builder(
        builder: (context) {
          return MultiBlocListener(
            listeners: [
              BlocListener<SorterToggleButtonCubit, SorterToggleButtonState>(
                listener: (context, sortingState) {
                  if (sortingState.sorterState == SortingOption.byRating) {
                    sightseeingSortingCubit!.sortList(
                        unsortedList: listTobuild!,
                        sortingOption: sortingState.sorterState!,
                        userLocation: userLocation,
                        distanceMap: distanceMap);
                  }
                  if (sortingState.sorterState == SortingOption.byDistance) {
                    sightseeingSortingCubit!.sortList(
                        unsortedList: listTobuild!,
                        sortingOption: sortingState.sorterState!,
                        userLocation: userLocation,
                        distanceMap: distanceMap);
                  }
                },
              ),
            ],
            child: BlocBuilder<SortingCubit, SortingState>(
              builder: (context, state) {
                return Scaffold(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    appBar: AppBar(),
                    body: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          BlocBuilder<SorterToggleButtonCubit,
                              SorterToggleButtonState>(
                            builder: (context, sortingState) {
                              return SorterRadioButtonWidget(
                                  state: sortingState);
                            },
                          ),
                          SeeAllPageGridView(
                              listTobuild: listTobuild,
                              distanceMap: distanceMap),
                        ],
                      ),
                    ));
              },
            ),
          );
        },
      ),
    );
  }
}
