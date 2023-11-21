import 'package:flutter/material.dart';
import 'package:guide_me/data/data.dart';

import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

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
      child: SizedBox(
        height: 120,
        child: Column(
          children: [
            CollectionDialogUserInputReaderTextField(
                listToCreate: listToCreate, textController: _textController),
            AddCollectionButton(
                textController: _textController, listToCreate: listToCreate)
          ],
        ),
      ),
    );
  }
}
