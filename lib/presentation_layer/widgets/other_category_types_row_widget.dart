import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/category_button_state.dart';

import '../../business_layer/cubit/category_button_cubit.dart';

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
            child: ListView.separated(
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
                  child: Container(
                    // color: Colors.blue,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: isSelected
                            ? const Color(0xffF3F0E6)
                            : const Color(0xffF3F0E6).withOpacity(0.25)),
                    height: 28,
                    width: 100,
                    child: Center(
                      child: Text(
                        listOfCategories[index],
                        style: TextStyle(
                            color: isSelected
                                ? const Color(0xff292F32)
                                : const Color(0xffF3F0E6),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                );
              },
              itemCount: listOfCategories.length,
            ),
          ),
        );
      },
    );
  }
}
