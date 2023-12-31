import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class OtherCategoryTypesRowWidget extends StatelessWidget {
  const OtherCategoryTypesRowWidget({
    super.key,
    required this.listOfCategories,
  });

  final List<String> listOfCategories;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryCubitState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: SizedBox(
            height: 28,
            child: OtherCategoryListViewSeparatedWidget(
                listOfCategories: listOfCategories),
          ),
        );
      },
    );
  }
}
