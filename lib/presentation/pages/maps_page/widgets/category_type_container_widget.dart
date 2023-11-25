import 'package:flutter/widgets.dart';

import '../../../../data/get_localized_string_method.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CategoryTypeContainer extends StatelessWidget {
  const CategoryTypeContainer({
    Key? key,
    required this.index,
    required this.isSelected,
    required this.listOfCategories,
  }) : super(key: key);
  final int index;
  final bool isSelected;
  final List<String> listOfCategories;

  @override
  Widget build(BuildContext context) {
    String categoryType = getLocalizedString(
      localization: AppLocalizations.of(context)!,
      textLabel: listOfCategories[index],
    );
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: isSelected
              ? const Color(0xffF3F0E6)
              : const Color(0xffF3F0E6).withOpacity(0.25)),
      height: 28,
      width: 100,
      child: Center(
        child: Text(
          categoryType,
          style: TextStyle(
              color: isSelected
                  ? const Color(0xff292F32)
                  : const Color(0xffF3F0E6),
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
