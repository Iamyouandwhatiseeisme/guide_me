import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
    const imageIfNoImageIsAvailable =
        'https://static.vecteezy.com/system/resources/thumbnails/022/059/000/small/no-image-available-icon-vector.jpg';
    String image = '';
    return FutureBuilder(
      future: _dataFetchController.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 36),
            child: Container(
              height: 500,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: listOfPlaces.length,
                  itemBuilder: (context, index) {
                    String? photoReference =
                        listOfPlaces[index].photos?[0]['photo_reference'];
                    if (photoReference != null) {
                      image =
                          'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=$apiKey';
                    } else {
                      image = imageIfNoImageIsAvailable;
                    }
                    return Container(
                      width: 390,
                      height: 282,
                      child: Stack(children: [
                        Column(
                          children: [
                            Image.network(image),
                            Text(
                              listOfPlaces[index].name,
                              style: const TextStyle(color: Colors.white),
                            ),
                            Row(children: [
                              Text(distanceMap[listOfPlaces[index]].toString())
                            ]),
                          ],
                        ),
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
