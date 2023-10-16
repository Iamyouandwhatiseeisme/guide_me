import 'package:flutter/material.dart';
import 'package:guide_me/data_layer/models/collection_model.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BuildDialogForCollectionsPage extends BuildADialogOnMapsWindowWidget {
  final NearbyPlacesModel placeToAdd;
  const BuildDialogForCollectionsPage(
      {super.key,
      required super.textLabel,
      required super.iconToDisplay,
      required super.screenHeight,
      required super.screenWidth,
      required super.apiKey,
      required this.placeToAdd,
      super.lat,
      super.lon});
  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController();
    return Dialog(
      insetPadding: const EdgeInsets.all(0),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xff292F32),
            borderRadius: BorderRadius.circular(16)),
        height: screenHeight - 136,
        width: screenWidth,
        child: ValueListenableBuilder(
            valueListenable:
                Hive.box<CollectionModel>('CollectionLists').listenable(),
            builder: (context, box, child) {
              final List<CollectionModel> listOfCollections =
                  Hive.box<CollectionModel>("CollectionLists")
                      .toMap()
                      .values
                      .toList() as List<CollectionModel>;
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AddToCollectionsDialogTopTabWIthLabelIconAndExitButton(
                      iconToDisplay: iconToDisplay, textLabel: textLabel),
                  Container(
                    height: 500,
                    child: ListView.builder(
                        itemCount: listOfCollections.length,
                        itemBuilder: (context, index) {
                          return Text(listOfCollections[index].name);
                        }),
                  ),
                  CreateNewCollectionButton(textController: _textController)
                ],
              );
            }),
      ),
    );
  }
}
