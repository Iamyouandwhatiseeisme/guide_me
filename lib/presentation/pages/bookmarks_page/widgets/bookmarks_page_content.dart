import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/pages/pages.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';
import 'package:hive/hive.dart';

class BookmarksPageContent extends StatelessWidget {
  const BookmarksPageContent({
    super.key,
    required this.listOfFavorites,
    required this.widget,
    required this.box,
    required this.distanceMap,
  });
  final List<NearbyPlacesModel> listOfFavorites;
  final BookmarksPage widget;
  final Box<NearbyPlacesModel> box;
  final Map<NearbyPlacesModel, double?> distanceMap;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BoxManagamentCubit, BoxManagamentState>(
      builder: (context, state) {
        return BlocBuilder<BookmarksTabCubit, TabOption>(
          builder: (context, tabOptionstate) {
            bool isFavorites = tabOptionstate == TabOption.favorites;
            return isFavorites
                ? FavoritesPageContent(
                    tabOptionState: isFavorites,
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
    );
  }
}
