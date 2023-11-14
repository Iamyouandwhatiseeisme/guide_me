// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/sightseeing_sorting_cubit.dart';
import 'package:guide_me/business_layer/cubit/sorter_toggle_button_cubit.dart';

import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class SeeAllPage extends StatefulWidget {
  const SeeAllPage({
    Key? key,
  }) : super(key: key);

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  List<NearbyPlacesModel>? listTobuild;
  double? userLat;
  double? userLon;

  SightseeingSortingCubit? sightseeingSortingCubit;
  SorterToggleButtonCubit? sorterToggleButtonCubit;
  SorterRadioButtonWidget? sorterRadioButtonWidget;

  Map<NearbyPlacesModel, double?> distanceMap = {};

  @override
  Widget build(BuildContext context) {
    final passedPayLoad =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    final seeAllPagePayload = passedPayLoad[0] as SeeAllPagePayload;
    listTobuild = seeAllPagePayload.listToBuild;
    userLat = seeAllPagePayload.userLat;
    userLon = seeAllPagePayload.userLon;

    sightseeingSortingCubit = seeAllPagePayload.sortingCubit;
    sorterToggleButtonCubit = seeAllPagePayload.sorterToggleButtonCubit;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: sightseeingSortingCubit!,
        ),
        BlocProvider.value(
          value: sorterToggleButtonCubit!,
        ),
      ],
      child: Builder(builder: (context) {
        return BlocBuilder<SightseeingSortingCubit, SightseeingSortingState>(
          builder: (context, sortedListState) {
            return BlocBuilder<SorterToggleButtonCubit,
                SortertoggleButtonState>(builder: (context, sorterState) {
              sightseeingSortingCubit!.sortList(listTobuild!, sorterState.value,
                  userLat!, userLon!, distanceMap);

              return Scaffold(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  appBar: AppBar(),
                  body: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SorterRadioButtonWidget(
                            userLat: userLat!,
                            userLon: userLon!,
                            state: sorterState),
                        SizedBox(
                          height: 1000,
                          width: 460,
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 0.70),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  final placePagePayLoad = PlacePagePayLoad(
                                      model: listTobuild![index]);
                                  Navigator.pushNamed(
                                    context,
                                    'placePage',
                                    arguments: [placePagePayLoad],
                                  );
                                },
                                child: SightseeingsPlaceCard(
                                  place: listTobuild![index],
                                  distance: distanceMap[listTobuild![index]],
                                ),
                              );
                            },
                            itemCount: listTobuild!.length,
                          ),
                        ),
                      ],
                    ),
                  ));
            });
          },
        );
      }),
    );
  }
}
