// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guide_me/business_layer/cubit/fetch_searched_items_cubit.dart';
import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/data_layer/httpClients/google_api_client.dart';
import 'package:guide_me/main.dart';
import 'package:guide_me/presentation_layer/widgets/page_payloads/searches_page_payload.dart';

import '../../../data_layer/models/nearby_places_model.dart';

class CustomTextFormField extends StatelessWidget {
  final List<NearbyPlacesModel> listOfSearchedPlaces;

  final TextEditingController searchController;
  final Color textColor;
  final double radiusSize;

  final FetchSearchedItemsCubit? fetchSearchedItemsCubit;
  CustomTextFormField({
    Key? key,
    required this.textColor,
    required this.radiusSize,
    required this.color,
    required this.searchController,
    required this.listOfSearchedPlaces,
    this.fetchSearchedItemsCubit,
  }) : super(key: key);

  final Color color;
  final googleApiClient = sl.sl<GoogleApiClient>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: () async {
        final UserLocation userLocation = sl.sl.get<UserLocation>();
        BlocProvider.of<FetchSearchedItemsCubit>(context).searchListFetcher(
            searchController.text, listOfSearchedPlaces, googleApiClient);
        final searchesPagePayload = SearchesPagePayload(
            listToBuild: listOfSearchedPlaces,
            fetchSearchedItemsCubit: fetchSearchedItemsCubit!,
            userLocation: userLocation);
        Navigator.pushNamed(context, 'searchesPage',
            arguments: [searchesPagePayload]);
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
