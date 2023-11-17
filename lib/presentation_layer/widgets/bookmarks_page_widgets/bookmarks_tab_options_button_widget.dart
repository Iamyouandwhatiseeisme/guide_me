import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BookmarksPageTabOptionsButtons extends StatelessWidget {
  const BookmarksPageTabOptionsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarksTabCubit, TabOption>(
      builder: (context, selectedTab) {
        return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          TabOptionWidget(
            isSelected: selectedTab == TabOption.favorites,
            tabOption: TabOption.favorites,
            tabLabel: AppLocalizations.of(context)!.favorites,
          ),
          TabOptionWidget(
            isSelected: selectedTab == TabOption.collections,
            tabOption: TabOption.collections,
            tabLabel: AppLocalizations.of(context)!.collection,
          ),
        ]);
      },
    );
  }
}
