// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/data_layer/toggle_favorites_function.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:permission_handler/permission_handler.dart';

class FutureBuilderForAlistInMapsPageTypeView extends StatefulWidget {
  const FutureBuilderForAlistInMapsPageTypeView(
      {super.key,
      required this.apiKey,
      required Completer<String> dataFetchController,
      required this.listOfPlaces,
      required this.distanceMap,
      r})
      : _dataFetchController = dataFetchController;
  final String apiKey;

  final Completer<String> _dataFetchController;
  final List<NearbyPlacesModel> listOfPlaces;
  final Map<NearbyPlacesModel, double?> distanceMap;

  @override
  State<FutureBuilderForAlistInMapsPageTypeView> createState() =>
      _FutureBuilderForAlistInMapsPageTypeViewState();
}

class _FutureBuilderForAlistInMapsPageTypeViewState
    extends State<FutureBuilderForAlistInMapsPageTypeView> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    const imageIfNoImageIsAvailable =
        'https://static.vecteezy.com/system/resources/thumbnails/022/059/000/small/no-image-available-icon-vector.jpg';
    String image = '';
    return FutureBuilder(
      future: widget._dataFetchController.future,
      builder: (context, snapshot) {
        final box = Hive.box<NearbyPlacesModel>("FavoritedPlaces");
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 36),
            child: SizedBox(
              height: 500,
              child: ValueListenableBuilder(
                  valueListenable: box.listenable(),
                  builder: (context, value, child) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: widget.listOfPlaces.length,
                        itemBuilder: (context, index) {
                          final distance =
                              widget.distanceMap[widget.listOfPlaces[index]];
                          final placeToDisplay = widget.listOfPlaces[index];
                          final placeName = widget.listOfPlaces[index].name;

                          String? photoReference = widget.listOfPlaces[index]
                              .photos?[0]['photo_reference'];
                          if (photoReference != null) {
                            image =
                                'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=${widget.apiKey}';
                          } else {
                            image = imageIfNoImageIsAvailable;
                          }
                          return SizedBox(
                            width: 390,
                            height: 282,
                            child: Stack(children: [
                              PlaceCardForMapsTypeListWidget(
                                  apiKey: widget.apiKey,
                                  placeToDisplay: placeToDisplay,
                                  image: image,
                                  listOfPlaces: widget.listOfPlaces,
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
                                        color: const Color(0xffF3F0E6)
                                            .withAlpha(40),
                                      ),
                                      child: FavoriteButton(
                                          color: Color(0xffF3F0E6),
                                          placeToDisplay: placeToDisplay,
                                          box: box)))
                            ]),
                          );
                        });
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
