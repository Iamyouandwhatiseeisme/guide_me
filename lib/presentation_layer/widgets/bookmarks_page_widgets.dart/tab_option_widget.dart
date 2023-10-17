// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/bookmarks_tab_cubit.dart';

class TabOptionWidget extends StatelessWidget {
  final TabOption tabOption;
  final String tabLabel;
  final bool isSelected;
  const TabOptionWidget({
    Key? key,
    required this.tabOption,
    required this.tabLabel,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contaienrWidth = (MediaQuery.of(context).size.width) / 2;
    final bookmarksTabCubit = BlocProvider.of<BookmarksTabCubit>(context);
    return GestureDetector(
      onTap: () {
        bookmarksTabCubit.selectTab(tabOption);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 0.5,
                    color: isSelected
                        ? const Color(0xff292F32) // Selected tab color
                        : const Color(0xff292F32).withOpacity(0.5)))),
        width: contaienrWidth,
        height: 60,
        child: Center(
            child: Text(
          tabLabel,
          style: const TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 20,
              color: Color(0xff292F32)),
        )),
      ),
    );
  }
}
