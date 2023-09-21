import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/what_to_visit_toggle_button_dart_cubit.dart';
import 'package:guide_me/business_layer/widgets/business_widgets.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class FirstPageScaffoldIfLoadedCorrectly extends StatelessWidget {
  const FirstPageScaffoldIfLoadedCorrectly({
    super.key,
    required this.listOfNearbyPlaces,
  });

  final List<NearbyPlacesModel> listOfNearbyPlaces;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F0E6),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(48),
        child: FirstPageAppBar(),
      ),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => WhatToVisitToggleButtonCubit(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchTextFieldWIdget(),
              const SizedBox(
                height: 24,
              ),
              const RecommendedWidget(),
              const SizedBox(
                height: 12,
              ),
              recommended_places_card_builder(
                  listOfNearbyPlaces: listOfNearbyPlaces),
              const SizedBox(
                height: 48,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Text(
                      'What to visit',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.15,
                          color: Color(0xff292F32)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Text('See all',
                        style: TextStyle(
                            decorationColor: Color.fromARGB(75, 41, 47, 50),
                            decoration: TextDecoration.underline,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color.fromARGB(75, 41, 47, 50))),
                  )
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              const WhatToVisitRadioButtonWidget()
            ],
          ),
        ),
      ),
    );
  }
}
