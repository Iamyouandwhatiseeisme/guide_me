// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/main.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/data_layer/create_distance_map_method.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({
    Key? key,
  }) : super(key: key);

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  late List<NearbyPlacesModel> listOfPlaces = [];
  Map<NearbyPlacesModel, double?> distanceMap = {};

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void deleteItemAndRefresh(NearbyPlacesModel place,
      List<NearbyPlacesModel> listOfFavorites, Box<NearbyPlacesModel> box) {
    Hive.box<NearbyPlacesModel>('FavoritedPlaces').delete(place.hashCode);
    listOfFavorites.clear();
    listOfFavorites = box.toMap().values.toList();

    refreshList();
  }

  void refreshList() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final box = Hive.box<NearbyPlacesModel>("FavoritedPlaces");
    final listOfFavorites = box.toMap().values.toList();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BookmarksTabCubit(),
        ),
      ],
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.bookmarks,
            style: const TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: Color(0xffF3F0E6)),
          ),
          iconTheme: const IconThemeData(color: Color(0xffF3F0E6)),
          backgroundColor: const Color(0xff292F32),
        ),
        body: Builder(builder: (context) {
          createDistanceMap(
            distanceMap,
            listOfFavorites,
          );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const BookmarksPageTabOptionsButtons(),
              BookmarksPageContent(
                  deleteItemAndRefresh: deleteItemAndRefresh,
                  listOfFavorites: listOfFavorites,
                  widget: widget,
                  box: box,
                  distanceMap: distanceMap),
              const BookmarksPageBottomLabelAndButtonBuilder()
            ],
          );
        }),
      ),
    );
  }
}
