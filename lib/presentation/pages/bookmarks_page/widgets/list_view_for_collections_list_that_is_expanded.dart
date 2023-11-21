import 'package:flutter/material.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';
import 'package:hive/hive.dart';

import '../../../../data/data.dart';
import '../bookmarks_page.dart';

class ListViewForCollectionsListThatIsExpanded extends StatelessWidget {
  const ListViewForCollectionsListThatIsExpanded({
    super.key,
    required this.index,
    required this.isFavorites,
    required this.listToPass,
    required this.widget,
    required this.box,
    required this.distanceMap,
  });
  final int index;
  final bool isFavorites;
  final List<CollectionModel> listToPass;
  final BookmarksPage widget;
  final Box<CollectionModel> box;
  final Map<NearbyPlacesModel, double?> distanceMap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: Column(
        children: [
          FavoritesPageContent(
              nameOfList: listToPass[index].name,
              tabOptionState: isFavorites,
              onDelete: () {},
              listOfFavorites: listToPass[index].items,
              widget: widget,
              box: box,
              distanceMap: distanceMap),
        ],
      ),
    );
  }
}
