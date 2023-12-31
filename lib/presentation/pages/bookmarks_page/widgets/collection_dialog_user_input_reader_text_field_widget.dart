import 'package:flutter/material.dart';
import 'package:guide_me/data/data.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../main.dart';

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
    final localDataSource = sl.get<LocalDataSource>();
    return TextFormField(
      onFieldSubmitted: (String value) {
        String nameOfCollection = _textController.text;
        localDataSource.addToCollectionList(
            name: nameOfCollection, items: listToCreate);
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
          hintText: AppLocalizations.of(context)!.enterNameOfYourCollection,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(22))),
    );
  }
}
