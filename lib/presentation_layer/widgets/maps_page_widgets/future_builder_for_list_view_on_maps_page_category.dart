import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FutureBuilderForAlistInMapsPageTypeView extends StatelessWidget {
  const FutureBuilderForAlistInMapsPageTypeView({
    super.key,
    required Completer<String> dataFetchController,
    required this.listOfPlaces,
  }) : _dataFetchController = dataFetchController;

  final Completer<String> _dataFetchController;
  final List<NearbyPlacesModel> listOfPlaces;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _dataFetchController.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            height: 500,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: listOfPlaces.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 266,
                    child: Text(
                      listOfPlaces[index].name,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                }),
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
