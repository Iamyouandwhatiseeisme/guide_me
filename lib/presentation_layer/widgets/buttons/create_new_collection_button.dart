import 'package:flutter/material.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';

import '../presentation_layer_widgets.dart';

class CreateNewCollectionButton extends StatelessWidget {
  const CreateNewCollectionButton({
    super.key,
    required TextEditingController textController,
  }) : _textController = textController;

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              List<NearbyPlacesModel> listToCreate = [];
              return DialogForCollectionAdding(
                  textController: _textController, listToCreate: listToCreate);
            });
      },
      child: const AddCollectionLabel(),
    );
  }
}
