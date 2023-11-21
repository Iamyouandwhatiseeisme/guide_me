import 'package:flutter/material.dart';

import '../../../../data/data.dart';
import '../../../widgets/presentation_layer_widgets.dart';

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
