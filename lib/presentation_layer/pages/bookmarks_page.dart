// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/is_exapnded_cubit.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/data_layer/create_distance_map_method.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../data_layer/models/collection_model.dart';
import '../widgets/custom_bottom_navigatio_bar_widget.dart';

class BookmarksPage extends StatefulWidget {
  final String? apiKey;
  final CustomBottomNavigationBar customBottomAppBar;

  const BookmarksPage({
    Key? key,
    required this.apiKey,
    required this.customBottomAppBar,
  }) : super(key: key);

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  late List<NearbyPlacesModel> listOfPlaces = [];
  Map<NearbyPlacesModel, double?> distanceMap = {};
  late double userLat;
  late double userLon;

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
        BlocProvider(
          create: (context) => GeolocatorCubit(),
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xffF3F0E6),
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Bookmarks',
            style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 20,
                color: Color(0xffF3F0E6)),
          ),
          iconTheme: const IconThemeData(color: Color(0xffF3F0E6)),
          backgroundColor: const Color(0xff292F32),
        ),
        body: Builder(builder: (context) {
          final locationState = BlocProvider.of<GeolocatorCubit>(context);
          locationState.getLocation();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const BookmarksPageTabOptionsButtons(),
              BlocBuilder<GeolocatorCubit, LocationState>(
                builder: (context, state) {
                  if (state is LocationLoaded) {
                    userLat = state.position.latitude;
                    userLon = state.position.longitude;

                    createDistanceMap(
                        distanceMap, listOfFavorites, userLat, userLon);
                  }
                  return BlocBuilder<BookmarksTabCubit, TabOption>(
                    builder: (context, tabOptionstate) {
                      bool isFavorites = tabOptionstate == TabOption.favorites;
                      return isFavorites
                          ? FavoritesPageContent(
                              tabOptionState: isFavorites,
                              onDelete: deleteItemAndRefresh,
                              listOfFavorites: listOfFavorites,
                              widget: widget,
                              box: box,
                              distanceMap: distanceMap)
                          : CollectionsTabPageContent(
                              isFavorites: isFavorites,
                              widget: widget,
                              distanceMap: distanceMap);
                    },
                  );
                },
              ),
              const BookmarksPageBottomLabelAndButtonBuilder()
            ],
          );
        }),
      ),
    );
  }
}
