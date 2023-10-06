import 'dart:async';

import 'package:flutter/material.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class FutureBuilderForOtherCategoryListView extends StatelessWidget {
  const FutureBuilderForOtherCategoryListView({
    super.key,
    required Completer<String> mapLoadedController,
    required this.cachedData,
    required this.category,
  }) : _mapLoadedController = mapLoadedController;

  final Completer<String> _mapLoadedController;
  final Map<String, List<NearbyPlacesModel>> cachedData;
  final String category;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _mapLoadedController.future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              height: 500,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: cachedData[category]!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 266,
                      child: Text(
                        cachedData[category]![index].name,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: LoadingAnimationWidget.inkDrop(
                    color: Colors.red, size: 24));
          } else {
            return Text('Error: ${snapshot.error}');
          }
        });
  }
}
