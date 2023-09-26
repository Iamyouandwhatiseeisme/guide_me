// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/sorter_toggle_button_cubit.dart';

import '../../data_layer/models/nearby_places_model.dart';

// ignore: must_be_immutable
class SorterRadioButtonWidget extends StatelessWidget {
  final double userLat;
  final double userLon;
  final List<NearbyPlacesModel> listOfSightseeings;
  SorterToggleButtonInitial state;

  SorterRadioButtonWidget({
    Key? key,
    required this.userLat,
    required this.userLon,
    required this.listOfSightseeings,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SorterToggleButtonCubit, SorterToggleButtonInitial>(
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
                          child: const Center(child: Text('Budget Friendly')))),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<SorterToggleButtonCubit>(context)
                            .selectRadioButton(1);
                      },
                      child: const Text('Highest Rated')),
                ),
                GestureDetector(
                    onTap: () {
                      BlocProvider.of<SorterToggleButtonCubit>(context)
                          .selectRadioButton(2);
                    },
                    child: const Text('Closest To You'))
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
                      child: const Text('Budget Friendly'))),
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
                        child: const Center(child: Text('Highest Rated')))),
              ),
              GestureDetector(
                  onTap: () {
                    BlocProvider.of<SorterToggleButtonCubit>(context)
                        .selectRadioButton(2);
                  },
                  child: const Text('Closest To You'))
            ]));
      } else if (state.value == 2) {
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
                      child: const Text('Budget Friendly'))),
              Padding(
                padding: const EdgeInsets.only(right: 25.0),
                child: GestureDetector(
                    onTap: () {
                      BlocProvider.of<SorterToggleButtonCubit>(context)
                          .selectRadioButton(1);
                    },
                    child: const Text('Highest Rated')),
              ),
              GestureDetector(
                  onTap: () {
                    BlocProvider.of<SorterToggleButtonCubit>(context)
                        .selectRadioButton(2);
                  },
                  child: Container(
                      width: 110,
                      height: 28,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32)),
                      child: const Center(child: Text('Closest To You'))))
            ]));
      } else {
        return const SizedBox();
      }
    });
  }
}
