import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class BookmarksPageBottomLabelAndButtonBuilder extends StatelessWidget {
  const BookmarksPageBottomLabelAndButtonBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarksTabCubit, TabOption>(
      builder: (context, state) {
        if (state == TabOption.favorites) {
          return const TextLabelInstructionsToAddItemToCollections();
        } else {
          return const AddCollectionElevatedButton();
        }
      },
    );
  }
}
