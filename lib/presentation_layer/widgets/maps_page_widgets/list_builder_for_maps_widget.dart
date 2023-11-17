// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../data_layer/models/nearby_places_model.dart';

class ListBuilderForMapsWidgets extends StatelessWidget {
  const ListBuilderForMapsWidgets({
    Key? key,
    required this.cachedData,
    required this.category,
  }) : super(key: key);

  final Map<String, List<NearbyPlacesModel>> cachedData;
  final String category;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cachedData[category]!.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 266,
              child: Text(
                cachedData[category]![index].name,
                style: const TextStyle(color: Colors.white),
              ),
            );
          }),
    );
  }
}
