// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class OtherCategoryListViewSeparatedWidget extends StatelessWidget {
  const OtherCategoryListViewSeparatedWidget({
    super.key,
    required this.listOfCategories,
  });

  final List<String> listOfCategories;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryCubitState>(
      builder: (context, state) {
        return ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 12,
            );
          },
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final category = listOfCategories[index];
            final isSelected = category == state.selectedCategory;
            return GestureDetector(
              onTap: () {
                context.read<CategoryCubit>().updateCategory(category);
              },
              child: CategoryTypeContainer(
                  index: index,
                  isSelected: isSelected,
                  listOfCategories: listOfCategories),
            );
          },
          itemCount: listOfCategories.length,
        );
      },
    );
  }
}
