import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../business_layer/widgets/what_to_visit_radio_button_widget.dart';
import 'first_page_scaffold_if_loaded_correctly.dart';

class WhatToEatWidget extends StatelessWidget {
  const WhatToEatWidget({
    super.key,
    required this.lat,
    required this.lon,
    required this.widget,
  });

  final double lat;
  final double lon;
  final FirstPageScaffoldIfLoadedCorrectly widget;

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
        return BlocBuilder<SorterToggleButtonCubit, SorterToggleButtonInitial>(
          builder: (context, state) {
            return Column(
              children: [
                const LabelWIthCaregoryTypeNameAndSeeAllRow(
                    textToDisplay: 'What to eat'),
                const SizedBox(
                  height: 12,
                ),
                SorterRadioButtonWidget(
                    userLat: lat,
                    userLon: lon,
                    listOfSightseeings: widget.listOfPlacesForFood,
                    state: state),
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
