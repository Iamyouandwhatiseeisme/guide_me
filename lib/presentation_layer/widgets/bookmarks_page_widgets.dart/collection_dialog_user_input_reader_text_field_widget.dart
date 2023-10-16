import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../data_layer/models/collection_model.dart';
import '../../../data_layer/models/nearby_places_model.dart';

class CollectionDialogUserInputReaderTextField extends StatelessWidget {
  const CollectionDialogUserInputReaderTextField({
    super.key,
    required this.listToCreate,
    required TextEditingController textController,
  }) : _textController = textController;
  final List<NearbyPlacesModel> listToCreate;
  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (String value) {
        String nameOfCollection = _textController.text;
        Hive.box<CollectionModel>("CollectionLists").put(nameOfCollection,
            CollectionModel(name: nameOfCollection, items: listToCreate));
        _textController.clear();
        Navigator.pop(context);
      },
      controller: _textController,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.withOpacity(0.8)),
          hintText: "Enter name of your collection",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(22))),
    );
  }
}
