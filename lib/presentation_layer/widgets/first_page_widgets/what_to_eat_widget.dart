// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class WhatToEatWidget extends StatelessWidget {
  final Color colorOfLabel;
  const WhatToEatWidget({
    Key? key,
    required this.lat,
    required this.lon,
    required this.widget,
    required this.listToBuild,
    required this.colorOfLabel,
  }) : super(key: key);

  final double lat;
  final double lon;
  final FirstPageScaffoldIfLoadedCorrectly widget;
  final List<NearbyPlacesModel> listToBuild;

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
        final sortingCubit = BlocProvider.of<SightseeingSortingCubit>(context);
        final sorterToggleButtonCubit =
            BlocProvider.of<SorterToggleButtonCubit>(context);
        return BlocBuilder<SorterToggleButtonCubit, SortertoggleButtonState>(
          builder: (context, state) {
            return Column(
              children: [
                LabelWIthCaregoryTypeNameAndSeeAllRow(
                    colorOfLabel: colorOfLabel,
                    sortingCubit: sortingCubit,
                    sorterToggleButtonCubit: sorterToggleButtonCubit,
                    listToBuild: listToBuild,
                    userLat: widget.lat,
                    userLon: widget.lon,
                    textToDisplay: AppLocalizations.of(context)!.whatToEat),
                const SizedBox(
                  height: 12,
                ),
                SorterRadioButtonWidget(
                    userLat: lat, userLon: lon, state: state),
                const SizedBox(
                  height: 12,
                ),
                BlocBuilder<WhatToEatCubit, WhatToEatState>(
                  builder: (context, state) {
                    return SortableListViewCardBuilder(
                        userLat: lat,
                        userLon: lon,
                        listOfPassedPlaces: widget.listOfPlacesForFood);
                  },
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
