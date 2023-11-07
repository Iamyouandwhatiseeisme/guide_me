// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../business_layer/cubit/fetch_searched_items_cubit.dart';
import '../../data_layer/models/nearby_places_model.dart';

class SearchTextFieldWIdget extends StatelessWidget {
  final Color color;
  final TextEditingController searchController;
  final String apiKey;
  final List<NearbyPlacesModel> listOfSearchedPlaces;
  final Color primaryColor;
  final double userLat;
  final double userLon;
  final FetchSearchedItemsCubit? fetchSearchedItemsCubit;
  const SearchTextFieldWIdget({
    Key? key,
    required this.color,
    required this.primaryColor,
    required this.searchController,
    required this.apiKey,
    required this.listOfSearchedPlaces,
    this.fetchSearchedItemsCubit,
    required this.userLat,
    required this.userLon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 36),
      child: CustomTextFormField(
        userLat: userLat,
        userLon: userLon,
        fetchSearchedItemsCubit: fetchSearchedItemsCubit,
        listOfSearchedPlaces: listOfSearchedPlaces,
        apiKey: apiKey,
        searchController: searchController,
        textColor: primaryColor,
        color: color,
        radiusSize: 32,
      ),
    );
  }
}
