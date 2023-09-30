// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/sorter_toggle_button_cubit.dart';


// ignore: must_be_immutable
class SorterRadioButtonWidget extends StatelessWidget {
  final double userLat;
  final double userLon;

  SortertoggleButtonState state;

  SorterRadioButtonWidget({
    Key? key,
    required this.userLat,
    required this.userLon,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(32)),
                          child: const Center(child: Text('Highest Rated')))),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<SorterToggleButtonCubit>(context)
                            .selectRadioButton(1);
                      },
                      child: const Text('Closest to you')),
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
                      child: const Text('Highest Rated'))),
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
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(32)),
                        child: const Center(child: Text('Closest to you')))),
              ),
            ]));
      } else {
        return const SizedBox();
      }
    });
  }
}
