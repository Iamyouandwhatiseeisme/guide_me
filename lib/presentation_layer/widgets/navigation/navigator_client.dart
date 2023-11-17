import 'package:flutter/material.dart';
import 'package:guide_me/business_layer/cubit/bottom_navigation_bar_cubit.dart';

class NavigatorClient {
  void pushPage(BottomNavigationBarCubit bottomNavigationCubit, int index,
      List<String> screens, String currentPage, BuildContext context) {
    bottomNavigationCubit.changeTab(index);

    if (screens[index] == screens[0] && !currentPage.contains(screens[0])) {
      Navigator.pop(context);
    } else if (currentPage.contains(screens[0]) &&
        currentPage != screens[index]) {
      Navigator.pushNamed(
        context,
        screens[index],
      );
    } else if (!currentPage.contains(screens[0]) &&
        currentPage != screens[index]) {
      Navigator.pushReplacementNamed(context, screens[index]);
    }
  }
}
