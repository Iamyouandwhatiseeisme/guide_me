// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../../data_layer/models/nearby_places_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RecommendedSightseeingsWidget extends StatelessWidget {
  final Color colorOfLabel;
  const RecommendedSightseeingsWidget({
    Key? key,
    required this.widget,
    required this.listToBuild,
    required this.colorOfLabel,
  }) : super(key: key);

  final FirstPageContent widget;
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
                    textToDisplay:
                        AppLocalizations.of(context)!.whatToVisitLabel),
                const SizedBox(
                  height: 12,
                ),
                SorterRadioButtonWidget(state: state),
                const SizedBox(
                  height: 12,
                ),
                SortableListViewCardBuilder(
                    listOfPassedPlaces: widget.listOfSightseeings),
              ],
            );
          },
        );
      }),
    );
  }
}
