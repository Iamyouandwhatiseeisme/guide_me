import 'package:flutter/material.dart';
import 'package:guide_me/data/data.dart';

import '../../pages/bookmarks_page/widgets/dialog_for_collection_adding.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.addCollection,
              style: const TextStyle(
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
