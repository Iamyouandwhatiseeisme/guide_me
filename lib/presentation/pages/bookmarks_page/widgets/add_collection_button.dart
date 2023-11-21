import 'package:flutter/material.dart';
import 'package:guide_me/data/data.dart';
import 'package:hive/hive.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddCollectionButton extends StatefulWidget {
  const AddCollectionButton({
    super.key,
    required TextEditingController textController,
    required this.listToCreate,
  }) : _textController = textController;

  final TextEditingController _textController;
  final List<NearbyPlacesModel> listToCreate;

  @override
  State<AddCollectionButton> createState() => _AddCollectionButtonState();
}

class _AddCollectionButtonState extends State<AddCollectionButton> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
        valueListenable: widget._textController,
        builder: (context, value, child) {
          return ElevatedButton.icon(
            onPressed: widget._textController.text.isNotEmpty
                ? () {
                    String nameOfCollection = widget._textController.text;
                    Hive.box<CollectionModel>("CollectionLists").put(
                      nameOfCollection,
                      CollectionModel(
                          name: nameOfCollection, items: widget.listToCreate),
                    );
                    widget._textController.clear();
                    Navigator.pop(context);
                  }
                : null, // Set to null when text is empty
            icon: const Icon(Icons.add),
            label: Text(AppLocalizations.of(context)!.createCollection),
          );
        });
  }
}
