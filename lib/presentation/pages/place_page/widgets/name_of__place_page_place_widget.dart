import 'package:flutter/material.dart';
import 'package:guide_me/data/data.dart';

class NameOfThePlaceLabel extends StatelessWidget {
  const NameOfThePlaceLabel({
    super.key,
    required this.passedPlace,
  });

  final NearbyPlacesModel passedPlace;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0, left: 20),
      child: Text(
        passedPlace.name,
        style: const TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 30,
            color: Color(0xff292F32)),
      ),
    );
  }
}
