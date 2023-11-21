import 'package:flutter/material.dart';

import '../../../../data_layer/models/nearby_places_model.dart';

class DialogPlaceToAddTypeLabel extends StatelessWidget {
  const DialogPlaceToAddTypeLabel({
    super.key,
    required this.placeToAdd,
    required this.type,
  });

  final NearbyPlacesModel placeToAdd;
  final String type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Text(
        placeToAdd.types.isNotEmpty ? type : 'Information on types N/A',
        style: const TextStyle(color: Color(0xffF3F0E6)),
      ),
    );
  }
}
