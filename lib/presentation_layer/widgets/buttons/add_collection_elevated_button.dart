import 'package:flutter/material.dart';

import '../../../data_layer/models/nearby_places_model.dart';
import '../bookmarks_page_widgets.dart/dialog_for_collection_adding.dart';

class AddCollectionElevatedButton extends StatelessWidget {
  const AddCollectionElevatedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController textController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(bottom: 44.0, left: 55, right: 55),
      child: SizedBox(
        height: 60,
        width: 250,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffC75E6B),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32))),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  List<NearbyPlacesModel> listToCreate = [];
                  return DialogForCollectionAdding(
                      textController: textController,
                      listToCreate: listToCreate);
                });
          },
          child: const Center(
            child: Text(
              'Add collection',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Color(0xffF3F0E6)),
            ),
          ),
        ),
      ),
    );
  }
}
