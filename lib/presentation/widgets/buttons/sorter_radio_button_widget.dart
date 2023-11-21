// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class SorterRadioButtonWidget extends StatelessWidget {
  SortertoggleButtonState state;

  SorterRadioButtonWidget({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;

    return BlocBuilder<SorterToggleButtonCubit, SortertoggleButtonState>(
        builder: (context, state) {
      if (state.value == 0) {
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
                            .selectRadioButton(0);
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
                            .selectRadioButton(1);
                      },
                      child: Text(AppLocalizations.of(context)!.closestToYou)),
                ),
              ],
            ));
      } else if (state.value == 1) {
        return SizedBox(
            height: 32,
            width: 390,
            child: Row(children: [
              Padding(
                  padding: const EdgeInsets.only(right: 25.0, left: 20),
                  child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<SorterToggleButtonCubit>(context)
                            .selectRadioButton(0);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.highestRated,
                      ))),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<SorterToggleButtonCubit>(context)
                          .selectRadioButton(1);
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
        return const SizedBox();
      }
    });
  }
}
