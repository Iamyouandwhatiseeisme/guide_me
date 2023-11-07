// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guide_me/business_layer/cubit/fetch_searched_items_cubit.dart';

import '../../data_layer/models/nearby_places_model.dart';

class CustomTextFormField extends StatelessWidget {
  final List<NearbyPlacesModel> listOfSearchedPlaces;
  final String apiKey;
  final TextEditingController searchController;
  final Color textColor;
  final double radiusSize;
  final double userLat;
  final double userLon;
  final FetchSearchedItemsCubit? fetchSearchedItemsCubit;
  const CustomTextFormField({
    Key? key,
    required this.textColor,
    required this.radiusSize,
    required this.color,
    required this.searchController,
    required this.listOfSearchedPlaces,
    required this.apiKey,
    this.fetchSearchedItemsCubit,
    required this.userLat,
    required this.userLon,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: () async {
        BlocProvider.of<FetchSearchedItemsCubit>(context).searchListFetcher(
            searchController.text, listOfSearchedPlaces, apiKey);
        Navigator.pushNamed(context, 'searchesPage', arguments: [
          listOfSearchedPlaces,
          apiKey,
          fetchSearchedItemsCubit,
          userLat,
          userLon
        ]);
      },
      controller: searchController,
      textAlign: TextAlign.start,
      decoration: InputDecoration(
          prefixIcon: Container(
              padding: const EdgeInsets.only(left: 24, right: 12),
              child: Icon(
                Icons.search_outlined,
                color: textColor,
              )),
          filled: true,
          fillColor: color,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusSize),
            borderSide: BorderSide.none,
          ),
          hintText: AppLocalizations.of(context)!.searchFieldHintText,
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 16, color: textColor)),
    );
  }
}
