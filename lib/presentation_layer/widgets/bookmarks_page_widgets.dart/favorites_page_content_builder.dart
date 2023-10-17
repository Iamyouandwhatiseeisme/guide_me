import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/pages/bookmarks_page.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data_layer/models/nearby_places_model.dart';

class FavoritesPageContent extends StatefulWidget {
  const FavoritesPageContent({
    super.key,
    required this.onDelete,
    required this.listOfFavorites,
    required this.widget,
    required this.box,
    required this.distanceMap,
    required this.tabOptionState,
  });
  final bool tabOptionState;
  final List<NearbyPlacesModel> listOfFavorites;
  final BookmarksPage widget;
  final Box<dynamic> box;
  final Map<NearbyPlacesModel, double?> distanceMap;
  final Function onDelete;

  @override
  State<FavoritesPageContent> createState() => _FavoritesPageContentState();
}

class _FavoritesPageContentState extends State<FavoritesPageContent> {
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return Expanded(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: widget.listOfFavorites.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                  right: 10,
                ),
                child: SizedBox(
                  height: 113,
                  width: 250,
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(
                      context,
                      'placePage',
                      arguments: [
                        widget.widget.apiKey,
                        widget.listOfFavorites[index]
                      ],
                    ),
                    child: ValueListenableBuilder(
                        valueListenable: widget.box.listenable(),
                        builder: (context, box, child) {
                          return BookmarksPageCardWidget(
                            tabOptionState: widget.tabOptionState,
                            onDelete: () {
                              widget.onDelete(widget.listOfFavorites[index],
                                  widget.listOfFavorites, box);
                            },
                            apiKey: widget.widget.apiKey!,
                            distance: widget
                                .distanceMap[widget.listOfFavorites[index]],
                            place: widget.listOfFavorites[index],
                          );
                        }),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
