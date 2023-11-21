import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/presentation_layer/pages/pages.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:hive/hive.dart';

import '../../../data_layer/models/nearby_places_model.dart';

class BookmarksPageContent extends StatelessWidget {
  const BookmarksPageContent({
    super.key,
    required this.listOfFavorites,
    required this.widget,
    required this.box,
    required this.distanceMap,
    required this.deleteItem,
  });
  final Function deleteItem;
  final List<NearbyPlacesModel> listOfFavorites;
  final BookmarksPage widget;
  final Box<NearbyPlacesModel> box;
  final Map<NearbyPlacesModel, double?> distanceMap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarksTabCubit, TabOption>(
      builder: (context, tabOptionstate) {
        bool isFavorites = tabOptionstate == TabOption.favorites;
        return isFavorites
            ? FavoritesPageContent(
                tabOptionState: isFavorites,
                onDelete: deleteItem,
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
  }
}
