// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/sightseeing_sorting_cubit.dart';
import 'package:guide_me/business_layer/cubit/sorter_toggle_button_cubit.dart';
import 'package:guide_me/business_layer/widgets/business_widgets.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class SeeAllPage extends StatefulWidget {
  late List<NearbyPlacesModel>? listTobuild;
  late double? userLat;
  late double? userLon;
  late String? apiKey;
  late SightseeingSortingCubit? sightseeingSortingCubit;
  late SorterToggleButtonCubit? sorterToggleButtonCubit;
  late SorterRadioButtonWidget? sorterRadioButtonWidget;

  SeeAllPage({
    Key? key,
    this.listTobuild,
    this.userLat,
    this.userLon,
    this.apiKey,
    this.sightseeingSortingCubit,
    this.sorterToggleButtonCubit,
    this.sorterRadioButtonWidget,
  }) : super(key: key);

  @override
  State<SeeAllPage> createState() => _SeeAllPageState();
}

class _SeeAllPageState extends State<SeeAllPage> {
  Map<NearbyPlacesModel, double?> distanceMap = {};

  @override
  Widget build(BuildContext context) {
    final listOfArguments =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    widget.listTobuild = listOfArguments[0] as List<NearbyPlacesModel>;
    widget.userLat = listOfArguments[1] as double;
    widget.userLon = listOfArguments[2] as double;
    widget.apiKey = listOfArguments[3];
    widget.sightseeingSortingCubit =
        listOfArguments[4] as SightseeingSortingCubit;
    widget.sorterToggleButtonCubit =
        listOfArguments[5] as SorterToggleButtonCubit;
    // widget.sorterRadioButtonWidget =
    //     listOfArguments[6] as SorterRadioButtonWidget;

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: widget.sightseeingSortingCubit!,
        ),
        BlocProvider.value(
          value: widget.sorterToggleButtonCubit!,
        ),
      ],
      child: Builder(builder: (context) {
        return BlocBuilder<SightseeingSortingCubit, SightseeingSortingState>(
          builder: (context, sortedListState) {
            return BlocBuilder<SorterToggleButtonCubit,
                SortertoggleButtonState>(builder: (context, sorterState) {
              widget.sightseeingSortingCubit!.sortList(
                  widget.listTobuild!,
                  sorterState.value,
                  widget.userLat!,
                  widget.userLon!,
                  distanceMap);

              return Scaffold(
                  backgroundColor: const Color(0xffF3F0E6),
                  appBar: AppBar(),
                  body: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SorterRadioButtonWidget(
                            userLat: widget.userLat!,
                            userLon: widget.userLon!,
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
                                  arguments: [
                                    widget.apiKey,
                                    widget.listTobuild![index]
                                  ],
                                ),
                                child: SightseeingsPlaceCard(
                                    place: widget.listTobuild![index],
                                    distance:
                                        distanceMap[widget.listTobuild![index]],
                                    apiKey: widget.apiKey!),
                              );
                            },
                            itemCount: widget.listTobuild!.length,
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
