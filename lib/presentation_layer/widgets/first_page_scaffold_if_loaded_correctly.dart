// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/fetch_searched_items_cubit.dart';

import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/custom_bottom_navigatio_bar_widget.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class FirstPageScaffoldIfLoadedCorrectly extends StatefulWidget {
  final CustomBottomNavigationBar bottomNavigationBar;
  final double lat;
  final double lon;
  final String apiKey;
  const FirstPageScaffoldIfLoadedCorrectly({
    Key? key,
    required this.bottomNavigationBar,
    required this.lat,
    required this.lon,
    required this.apiKey,
    required this.listOfPlacesForFood,
    required this.listOfNearbyPlaces,
    required this.listOfSightseeings,
  }) : super(key: key);
  final List<NearbyPlacesModel> listOfPlacesForFood;
  final List<NearbyPlacesModel> listOfNearbyPlaces;
  final List<NearbyPlacesModel> listOfSightseeings;

  @override
  State<FirstPageScaffoldIfLoadedCorrectly> createState() =>
      _FirstPageScaffoldIfLoadedCorrectlyState();
}

class _FirstPageScaffoldIfLoadedCorrectlyState
    extends State<FirstPageScaffoldIfLoadedCorrectly> {
  final List<NearbyPlacesModel> listOfSearchedPlaces = [];
  final searchController = TextEditingController();
  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color secondaryColor = Theme.of(context).colorScheme.secondary;
    Color primaryColor = Theme.of(context).colorScheme.primary;
    return Builder(builder: (context) {
      final fetchSearchedItemsCubit =
          BlocProvider.of<FetchSearchedItemsCubit>(context);
      return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: FirstPageAppBar(
              apiKey: widget.apiKey,
            ),
          ),
          bottomNavigationBar: widget.bottomNavigationBar,
          body: SingleChildScrollView(child: Builder(
            builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchTextFieldWIdget(
                      userLat: widget.lat,
                      userLon: widget.lon,
                      fetchSearchedItemsCubit: fetchSearchedItemsCubit,
                      listOfSearchedPlaces: listOfSearchedPlaces,
                      apiKey: widget.apiKey,
                      searchController: searchController,
                      color: secondaryColor,
                      primaryColor: primaryColor),
                  const SizedBox(
                    height: 24,
                  ),
                  const RecommendedWidget(),
                  const SizedBox(
                    height: 12,
                  ),
                  RecommenPlacesCardBuilder(
                      apiKey: widget.apiKey,
                      listOfNearbyPlaces: widget.listOfNearbyPlaces),
                  const SizedBox(
                    height: 48,
                  ),
                  RecommendedSightseeingsWidget(
                    colorOfLabel: secondaryColor,
                    listToBuild: widget.listOfSightseeings,
                    widget: widget,
                    apiKey: widget.apiKey,
                    lat: widget.lat,
                    lon: widget.lon,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  WhatToEatWidget(
                      colorOfLabel: secondaryColor,
                      listToBuild: widget.listOfPlacesForFood,
                      apiKey: widget.apiKey,
                      lat: widget.lat,
                      lon: widget.lon,
                      widget: widget)
                ],
              );
            },
          )));
    });
  }
}
