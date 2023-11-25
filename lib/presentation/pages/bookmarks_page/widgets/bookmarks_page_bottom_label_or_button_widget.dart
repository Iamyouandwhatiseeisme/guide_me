import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class BookmarksPageBottomLabelAndButtonBuilder extends StatefulWidget {
  const BookmarksPageBottomLabelAndButtonBuilder({
    super.key,
  });

  @override
  State<BookmarksPageBottomLabelAndButtonBuilder> createState() =>
      _BookmarksPageBottomLabelAndButtonBuilderState();
}

class _BookmarksPageBottomLabelAndButtonBuilderState
    extends State<BookmarksPageBottomLabelAndButtonBuilder> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarksTabCubit, TabOption>(
      builder: (context, state) {
        if (state == TabOption.favorites) {
          return const TextLabelInstructionsToAddItemToCollections();
        } else {
          // return const AddCollectionElevatedButton();
          return Padding(
            padding: const EdgeInsets.only(bottom: 44.0, left: 55, right: 55),
            child: SizedBox(
              width: 250,
              height: 60,
              child: RedButton(
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
                  label: translation(context).addCollection),
            ),
          );
        }
      },
    );
  }
}
