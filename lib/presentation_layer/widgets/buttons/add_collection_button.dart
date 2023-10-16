import 'package:flutter/material.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:hive/hive.dart';

import '../../../data_layer/models/collection_model.dart';

class AddCollectionButton extends StatelessWidget {
  const AddCollectionButton({
    super.key,
    required TextEditingController textController,
    required this.listToCreate,
  }) : _textController = textController;

  final TextEditingController _textController;
  final List<NearbyPlacesModel> listToCreate;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        onPressed: () {
          String nameOfCollection = _textController.text;
          Hive.box<CollectionModel>("CollectionLists").put(nameOfCollection,
              CollectionModel(name: nameOfCollection, items: listToCreate));
          _textController.clear();
          Navigator.pop(context);
        },
        icon: const Icon(Icons.add),
        label: const Text('Create collection'));
  }
}
