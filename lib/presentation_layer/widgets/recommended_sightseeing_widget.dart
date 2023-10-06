// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../business_layer/widgets/sorter_radio_button_widget.dart';
import '../../data_layer/models/nearby_places_model.dart';

class RecommendedSightseeingsWidget extends StatelessWidget {
  final String apiKey;
  const RecommendedSightseeingsWidget({
    Key? key,
    required this.apiKey,
    required this.lat,
    required this.lon,
    required this.widget,
    required this.listToBuild,
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
                    sortingCubit: sortingCubit,
                    sorterToggleButtonCubit: sorterToggleButtonCubit,
                    listToBuild: listToBuild,
                    apiKey: widget.apiKey,
                    userLat: widget.lat,
                    userLon: widget.lon,
                    textToDisplay: 'What to Visit'),
                const SizedBox(
                  height: 12,
                ),
                SorterRadioButtonWidget(
                    userLat: lat, userLon: lon, state: state),
                const SizedBox(
                  height: 12,
                ),
                SortableListViewCardBuilder(
                    apiKey: apiKey,
                    userLat: lat,
                    userLon: lon,
                    listOfPassedPlaces: widget.listOfSightseeings),
              ],
            );
          },
        );
      }),
    );
  }
}
