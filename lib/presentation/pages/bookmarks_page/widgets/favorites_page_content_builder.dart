import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubit/box_managament_cubit.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/main.dart';
import 'package:guide_me/presentation/pages/bookmarks_page/bookmarks_page.dart';
import 'package:guide_me/presentation/widgets/navigation/navigator_client.dart';

import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritesPageContent extends StatefulWidget {
  const FavoritesPageContent({
    super.key,
    this.nameOfList,
    required this.listOfFavorites,
    required this.widget,
    required this.box,
    required this.distanceMap,
    required this.tabOptionState,
  });
  final String? nameOfList;
  final bool tabOptionState;
  final List<NearbyPlacesModel> listOfFavorites;
  final BookmarksPage widget;
  final Box<dynamic> box;
  final Map<NearbyPlacesModel, double?> distanceMap;

  @override
  State<FavoritesPageContent> createState() => _FavoritesPageContentState();
}

class _FavoritesPageContentState extends State<FavoritesPageContent> {
  final deleteItem = sl.get<LocalDataSource>();
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
                    onTap: () {
                      final placePagePayLoad = PlacePagePayLoad(
                          model: widget.listOfFavorites[index]);
                      Navigator.pushNamed(
                        context,
                        NavigatorClient.placePage,
                        arguments: placePagePayLoad,
                      );
                    },
                    child: BlocBuilder<BoxManagamentCubit, BoxManagamentState>(
                      builder: (context, state) {
                        return ValueListenableBuilder(
                            valueListenable: widget.box.listenable(),
                            builder: (context, box, child) {
                              if (box is Box<NearbyPlacesModel>) {
                                return BookmarksPageCardWidget(
                                    name: widget.nameOfList,
                                    tabOptionState: widget.tabOptionState,
                                    onDelete: () {
                                      BlocProvider.of<BoxManagamentCubit>(
                                              context)
                                          .deleteItem(
                                              widget.listOfFavorites[index],
                                              box);
                                    },
                                    distance: widget.distanceMap[
                                        widget.listOfFavorites[index]],
                                    place: state.listOfFavorites[index]
                                    // place: widget.listOfFavorites[index],
                                    );
                              } else {
                                return BookmarksPageCardWidget(
                                  name: widget.nameOfList,
                                  tabOptionState: widget.tabOptionState,
                                  onDelete: () {},
                                  distance: widget.distanceMap[
                                      widget.listOfFavorites[index]],
                                  place: widget.listOfFavorites[index],
                                );
                              }
                            });
                      },
                    ),
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
