// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../data_layer/models/nearby_places_model.dart';

class LabelWIthCaregoryTypeNameAndSeeAllRow extends StatelessWidget {
  final List<NearbyPlacesModel> listToBuild;
  final String apiKey;
  final double userLat;
  final double userLon;
  final String textToDisplay;
  final SightseeingSortingCubit sortingCubit; // Accept the sorting cubit
  final SorterToggleButtonCubit
      sorterToggleButtonCubit; // Accept the sorter toggle button cubit

  const LabelWIthCaregoryTypeNameAndSeeAllRow({
    Key? key,
    required this.listToBuild,
    required this.apiKey,
    required this.userLat,
    required this.userLon,
    required this.textToDisplay,
    required this.sortingCubit,
    required this.sorterToggleButtonCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      LabelForBuilderTypesWidget(
        textToDisplay: textToDisplay,
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'seeAllPage', arguments: [
              listToBuild,
              userLat,
              userLon,
              apiKey,
              sortingCubit,
              sorterToggleButtonCubit,
            ]);
          },
          child: const Text('See all',
              style: TextStyle(
                  decorationColor: Color.fromARGB(75, 41, 47, 50),
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(75, 41, 47, 50))),
        ),
      )
    ]);
  }
}
