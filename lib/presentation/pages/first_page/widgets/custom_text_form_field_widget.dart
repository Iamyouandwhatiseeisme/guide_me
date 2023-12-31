// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/main.dart';
import 'package:guide_me/presentation/widgets/navigation/navigator_client.dart';
import 'package:guide_me/presentation/widgets/page_payloads/searches_page_payload.dart';

class CustomTextFormField extends StatelessWidget {
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
    this.fetchSearchedItemsCubit,
  }) : super(key: key);

  final Color color;
  final googleApiClient = sl<GoogleDataSource>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onEditingComplete: () async {
        List<NearbyPlacesModel> listOfSearchedPlaces = [];
        final UserLocation userLocation = sl.get<UserLocation>();
        BlocProvider.of<FetchSearchedItemsCubit>(context).searchListFetcher(
            nameOfPlace: searchController.text,
            listOfSearched: listOfSearchedPlaces,
            googleApiClient: googleApiClient);
        final searchesPagePayload = SearchesPagePayload(
            listToBuild: listOfSearchedPlaces,
            fetchSearchedItemsCubit: fetchSearchedItemsCubit!,
            userLocation: userLocation);
        Navigator.pushNamed(context, NavigatorClient.searchesPage,
            arguments: searchesPagePayload);
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
          hintText: AppLocalizations.of(context)!.searchForActivityLocationEtc,
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 16, color: textColor)),
    );
  }
}
