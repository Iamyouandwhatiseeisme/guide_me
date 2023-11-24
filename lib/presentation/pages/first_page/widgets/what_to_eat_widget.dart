// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guide_me/bloc/cubits.dart';

import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

import '../../../../main.dart';

class WhatToEatWidget extends StatefulWidget {
  final Color colorOfLabel;
  const WhatToEatWidget({
    Key? key,
    required this.widget,
    required this.listToBuild,
    required this.colorOfLabel,
  }) : super(key: key);

  final FirstPageContent widget;
  final List<NearbyPlacesModel> listToBuild;

  @override
  State<WhatToEatWidget> createState() => _WhatToEatWidgetState();
}

class _WhatToEatWidgetState extends State<WhatToEatWidget> {
  Map<NearbyPlacesModel, double?> distanceMap = {};
  final UserLocation userLocation = sl.get<UserLocation>();
  bool isFetched = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SortingCubit(),
        ),
        BlocProvider(
          create: (context) => SorterToggleButtonCubit(),
        ),
      ],
      child: Builder(
        builder: (context) {
          final sortingCubit = BlocProvider.of<SortingCubit>(context);
          final sorterToggleButtonCubit =
              BlocProvider.of<SorterToggleButtonCubit>(context);
          return BlocListener<SorterToggleButtonCubit, SorterToggleButtonState>(
            listener: (context, sortingState) {
              if (sortingState.sorterState == SortingOption.byRating) {
                sortingCubit.sortList(
                    unsortedList: widget.listToBuild,
                    sortingOption: sortingState.sorterState!,
                    userLocation: userLocation,
                    distanceMap: distanceMap);
              }
              if (sortingState.sorterState == SortingOption.byDistance) {
                sortingCubit.sortList(
                    unsortedList: widget.listToBuild,
                    sortingOption: sortingState.sorterState!,
                    userLocation: userLocation,
                    distanceMap: distanceMap);
              }
            },
            child: BlocBuilder<SortingCubit, SortingState>(
              builder: (context, state) {
                return BlocBuilder<SorterToggleButtonCubit,
                    SorterToggleButtonState>(builder: (context, state) {
                  if (isFetched == false) {
                    sorterToggleButtonCubit
                        .selectRadioButton(SortingOption.byRating);
                    isFetched = true;
                  }

                  return Column(
                    children: [
                      LabelWIthCaregoryTypeNameAndSeeAllRow(
                          distanceMap: distanceMap,
                          colorOfLabel: widget.colorOfLabel,
                          sortingCubit: sortingCubit,
                          sorterToggleButtonCubit: sorterToggleButtonCubit,
                          listToBuild: widget.listToBuild,
                          textToDisplay:
                              AppLocalizations.of(context)!.whatToEat),
                      const SizedBox(
                        height: 12,
                      ),
                      SorterRadioButtonWidget(state: state),
                      const SizedBox(
                        height: 12,
                      ),
                      SortableListViewCardBuilder(
                          distanceMap: distanceMap,
                          listOfPassedPlaces: widget.listToBuild),
                    ],
                  );
                });
              },
            ),
          );
        },
      ),
    );
  }
}
