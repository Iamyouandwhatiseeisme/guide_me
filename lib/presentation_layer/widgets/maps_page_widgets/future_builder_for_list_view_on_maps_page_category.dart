// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/favorites_button_cubit.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class FutureBuilderForAlistInMapsPageTypeView extends StatelessWidget {
  const FutureBuilderForAlistInMapsPageTypeView(
      {super.key,
      required this.apiKey,
      required Completer<String> dataFetchController,
      required this.listOfPlaces,
      required this.distanceMap})
      : _dataFetchController = dataFetchController;
  final String apiKey;

  final Completer<String> _dataFetchController;
  final List<NearbyPlacesModel> listOfPlaces;
  final Map<NearbyPlacesModel, double?> distanceMap;

  @override
  Widget build(BuildContext context) {
    final favoritesCubit = BlocProvider.of<FavoritesCubit>(context);

    const imageIfNoImageIsAvailable =
        'https://static.vecteezy.com/system/resources/thumbnails/022/059/000/small/no-image-available-icon-vector.jpg';
    String image = '';
    return FutureBuilder(
      future: _dataFetchController.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 36),
            child: SizedBox(
              height: 500,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: listOfPlaces.length,
                  itemBuilder: (context, index) {
                    final distance = distanceMap[listOfPlaces[index]];
                    final placeToDisplay = listOfPlaces[index];
                    final placeName = listOfPlaces[index].name;

                    String? photoReference =
                        listOfPlaces[index].photos?[0]['photo_reference'];
                    if (photoReference != null) {
                      image =
                          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=$apiKey';
                    } else {
                      image = imageIfNoImageIsAvailable;
                    }
                    return SizedBox(
                      width: 390,
                      height: 282,
                      child: Stack(children: [
                        PlaceCardForMapsTypeListWidget(
                            apiKey: apiKey,
                            placeToDisplay: placeToDisplay,
                            image: image,
                            listOfPlaces: listOfPlaces,
                            distance: distance,
                            placeName: placeName),
                        Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                                width: 36,
                                height: 36,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(32),
                                  color: Color(0xffF3F0E6).withAlpha(40),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    if (favoritesCubit
                                        .isFavorite(placeToDisplay)) {
                                      favoritesCubit.removeFromFavorites(
                                        placeToDisplay,
                                      );
                                    } else {
                                      favoritesCubit.addToFavorites(
                                          placeToDisplay, distance);
                                    }
                                  },
                                  child: BlocBuilder<FavoritesCubit,
                                      List<FavoriteItem>>(
                                    builder: (context, state) {
                                      return Center(
                                          child: Icon(
                                        favoritesCubit
                                                .isFavorite(placeToDisplay)
                                            ? Icons.favorite
                                            : Icons.favorite_outline,
                                        color: Color(0xffF3F0E6),
                                      ));
                                    },
                                  ),
                                )))
                      ]),
                    );
                  }),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child:
                  LoadingAnimationWidget.inkDrop(color: Colors.red, size: 24));
        } else {
          return Text('Error: ${snapshot.error}');
        }
      },
    );
  }
}
