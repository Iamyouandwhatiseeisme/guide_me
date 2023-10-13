// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/custom_bottom_navigatio_bar_widget.dart';

class BookmarksPage extends StatefulWidget {
  final String? apiKey;
  final CustomBottomNavigationBar customBottomAppBar;
  const BookmarksPage({
    Key? key,
    this.apiKey,
    required this.customBottomAppBar,
  }) : super(key: key);

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  late List<NearbyPlacesModel> listOfPlaces = [];

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
    return BlocProvider(
      create: (context) => BookmarksTabCubit(),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const BookmarksPageTabOptionsButtons(),
            Builder(
              builder: (BuildContext context) {
                final listOfFavorites =
                    Hive.box<NearbyPlacesModel>('FavoritedPlaces')
                        .toMap()
                        .values
                        .toList();
                print('print: ${listOfFavorites.length}');
                return SizedBox(
                  height: 500,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listOfFavorites.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 10,
                        ),
                        child: SizedBox(
                          height: 280,
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
                              child: Text(listOfFavorites[index].name)
                              // child: SightseeingsPlaceCard(
                              //   apiKey: widget.apiKey!,
                              //   distance: 9,
                              //   place: listOfFavorites[index],
                              // ),
                              ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('delete'),
              onPressed: () {
                final listOfFavorites =
                    Hive.box<NearbyPlacesModel>('FavoritedPlaces');
                listOfFavorites.clear();
              },
            )
          ],
        ),
      ),
    );
  }
}
