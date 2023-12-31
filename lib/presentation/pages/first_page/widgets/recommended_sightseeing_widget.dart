// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';

import 'package:guide_me/data/data.dart';
import 'package:guide_me/main.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class RecommendedSightseeingsWidget extends StatefulWidget {
  final Color colorOfLabel;
  const RecommendedSightseeingsWidget({
    Key? key,
    required this.widget,
    required this.listToBuild,
    required this.colorOfLabel,
    required this.label,
  }) : super(key: key);

  final FirstPageContent widget;
  final String label;
  final List<NearbyPlacesModel> listToBuild;

  @override
  State<RecommendedSightseeingsWidget> createState() =>
      _RecommendedSightseeingsWidgetState();
}

class _RecommendedSightseeingsWidgetState
    extends State<RecommendedSightseeingsWidget> {
  final UserLocation userLocation = sl.get<UserLocation>();
  Map<NearbyPlacesModel, double?> distanceMap = {};

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SortingCubit()
            ..sortList(
                unsortedList: widget.listToBuild,
                sortingOption: SortingOption.byRating,
                userLocation: userLocation,
                distanceMap: distanceMap),
        ),
        BlocProvider(
          create: (context) => SorterToggleButtonCubit()
            ..selectRadioButton(SortingOption.byRating),
        ),
      ],
      child: Builder(builder: (context) {
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
          child: BlocBuilder<SorterToggleButtonCubit, SorterToggleButtonState>(
            builder: (context, state) {
              return Column(
                children: [
                  LabelWIthCaregoryTypeNameAndSeeAllRow(
                      distanceMap: distanceMap,
                      colorOfLabel: widget.colorOfLabel,
                      sortingCubit: sortingCubit,
                      sorterToggleButtonCubit: sorterToggleButtonCubit,
                      listToBuild: widget.listToBuild,
                      textToDisplay: widget.label),
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
            },
          ),
        );
      }),
    );
  }
}
