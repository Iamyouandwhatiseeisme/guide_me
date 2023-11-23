// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guide_me/bloc/cubits.dart';

import 'package:guide_me/data/data.dart';
import 'package:guide_me/main.dart';
import 'package:guide_me/presentation/widgets/navigation/navigator_client.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class LabelWIthCaregoryTypeNameAndSeeAllRow extends StatelessWidget {
  final List<NearbyPlacesModel> listToBuild;

  final String textToDisplay;
  final SortingCubit sortingCubit; // Accept the sorting cubit
  final SorterToggleButtonCubit sorterToggleButtonCubit;

  final Color colorOfLabel; // Accept the sorter toggle button cubit

  const LabelWIthCaregoryTypeNameAndSeeAllRow({
    Key? key,
    required this.listToBuild,
    required this.textToDisplay,
    required this.sortingCubit,
    required this.sorterToggleButtonCubit,
    required this.colorOfLabel,
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
            final UserLocation userLocation = sl.get<UserLocation>();
            final seeAllPagePayload = SeeAllPagePayload(
                listToBuild: listToBuild,
                userLocation: userLocation,
                sortingCubit: sortingCubit,
                sorterToggleButtonCubit: sorterToggleButtonCubit);
            Navigator.pushNamed(context, NavigatorClient.seeAllPage,
                arguments: seeAllPagePayload);
          },
          child: Text(AppLocalizations.of(context)!.seeAll,
              style: TextStyle(
                  decorationColor: Theme.of(context).colorScheme.secondary,
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: colorOfLabel)),
        ),
      )
    ]);
  }
}
