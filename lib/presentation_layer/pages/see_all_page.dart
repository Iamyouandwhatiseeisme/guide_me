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
  String? apiKey;
  SightseeingSortingCubit? sightseeingSortingCubit;
  SorterToggleButtonCubit? sorterToggleButtonCubit;
  SorterRadioButtonWidget? sorterRadioButtonWidget;

  Map<NearbyPlacesModel, double?> distanceMap = {};

  @override
  Widget build(BuildContext context) {
    final listOfArguments =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    listTobuild = listOfArguments[0] as List<NearbyPlacesModel>;
    userLat = listOfArguments[1] as double;
    userLon = listOfArguments[2] as double;
    apiKey = listOfArguments[3];
    sightseeingSortingCubit = listOfArguments[4] as SightseeingSortingCubit;
    sorterToggleButtonCubit = listOfArguments[5] as SorterToggleButtonCubit;

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
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  'placePage',
                                  arguments: [apiKey, listTobuild![index]],
                                ),
                                child: SightseeingsPlaceCard(
                                    place: listTobuild![index],
                                    distance: distanceMap[listTobuild![index]],
                                    apiKey: apiKey!),
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
