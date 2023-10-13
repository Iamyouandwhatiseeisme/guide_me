// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/data_layer/create_distance_map_method.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../widgets/custom_bottom_navigatio_bar_widget.dart';

class BookmarksPage extends StatefulWidget {
  late String? apiKey;
  final CustomBottomNavigationBar customBottomAppBar;

  BookmarksPage({
    Key? key,
    this.apiKey,
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

    refreshList();
  }

  Future refreshList() async {
    setState(() {
      isLoading = true;
    });

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final listOfArguments =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    widget.apiKey = listOfArguments[0] as String;

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
                  return Builder(
                    builder: (BuildContext context) {
                      final listOfFavorites =
                          Hive.box<NearbyPlacesModel>('FavoritedPlaces')
                              .toMap()
                              .values
                              .toList();

                      if (state is LocationLoaded) {
                        userLat = state.position.latitude;
                        userLon = state.position.longitude;

                        createDistanceMap(
                            distanceMap, listOfFavorites, userLat, userLon);
                      }

                      return SizedBox(
                        height: 600,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: listOfFavorites.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 20,
                                top: 10,
                              ),
                              child: SizedBox(
                                height: 113,
                                width: 250,
                                child: GestureDetector(
                                  onTap: () => Navigator.pushNamed(
                                    context,
                                    'placePage',
                                    arguments: [
                                      widget.apiKey,
                                      listOfFavorites[index]
                                    ],
                                  ),
                                  child: BookmarksPageCardWidget(
                                    apiKey: widget.apiKey!,
                                    distance:
                                        distanceMap[listOfFavorites[index]],
                                    place: listOfFavorites[index],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
              // ElevatedButton(
              //   child: const Text('delete'),
              //   onPressed: () {
              //     final listOfFavorites =
              //         Hive.box<NearbyPlacesModel>('FavoritedPlaces');
              //     listOfFavorites.clear();
              //   },
              // )
            ],
          );
        }),
      ),
    );
  }
}
