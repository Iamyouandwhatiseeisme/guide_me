// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guide_me/data/data.dart';

// ignore: must_be_immutable
class SorterRadioButtonWidget extends StatelessWidget {
  SorterToggleButtonState state;

  SorterRadioButtonWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return BlocBuilder<SorterToggleButtonCubit, SorterToggleButtonState>(
        builder: (context, state) {
      if (state.sorterState == SortingOption.byRating) {
        return SizedBox(
            height: 32,
            width: 390,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0, left: 20),
                  child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<SorterToggleButtonCubit>(context)
                            .selectRadioButton(SortingOption.byRating);
                      },
                      child: Container(
                          width: 110,
                          height: 28,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(32)),
                          child: Center(
                              child: Text(
                            AppLocalizations.of(context)!.highestRated,
                          )))),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<SorterToggleButtonCubit>(context)
                            .selectRadioButton(SortingOption.byDistance);
                      },
                      child: Text(AppLocalizations.of(context)!.closestToYou)),
                ),
              ],
            ));
      } else if (state.sorterState == SortingOption.byDistance) {
        return SizedBox(
            height: 32,
            width: 390,
            child: Row(children: [
              Padding(
                  padding: const EdgeInsets.only(right: 25.0, left: 20),
                  child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<SorterToggleButtonCubit>(context)
                            .selectRadioButton(SortingOption.byRating);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.highestRated,
                      ))),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<SorterToggleButtonCubit>(context)
                          .selectRadioButton(SortingOption.byDistance);
                    },
                    child: Container(
                        width: 110,
                        height: 28,
                        decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(32)),
                        child: Center(
                            child: Text(
                          AppLocalizations.of(context)!.closestToYou,
                        )))),
              ),
            ]));
      } else {
        return Container(
          height: 200,
          width: 200,
          color: Colors.black,
        );
      }
    });
  }
}
