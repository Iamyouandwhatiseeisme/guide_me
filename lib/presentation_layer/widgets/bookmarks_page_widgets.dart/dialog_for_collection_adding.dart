import 'package:flutter/material.dart';

import 'package:guide_me/data_layer/models/nearby_places_model.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class DialogForCollectionAdding extends StatelessWidget {
  const DialogForCollectionAdding({
    super.key,
    required TextEditingController textController,
    required this.listToCreate,
  }) : _textController = textController;

  final TextEditingController _textController;
  final List<NearbyPlacesModel> listToCreate;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 120,
        child: Column(
          children: [
            CollectionDialogUserInputReaderTextField(
                textController: _textController),
            AddCollectionButton(
                textController: _textController, listToCreate: listToCreate)
          ],
        ),
      ),
    );
  }
}
