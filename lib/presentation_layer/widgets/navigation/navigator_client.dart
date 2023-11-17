import 'package:flutter/material.dart';
import 'package:guide_me/business_layer/cubit/bottom_navigation_bar_cubit.dart';
import 'package:guide_me/presentation_layer/pages/pages.dart';

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

  final Map<String, WidgetBuilder> routes = {
    '/': (context) => const WelcomePage(),
    'authPage': (context) => const AuthPage(),
    'firstPage': (context) => const FirstPage(),
    'placePage': (context) => const PlacePage(),
    'seeAllPage': (context) => const SeeAllPage(),
    'mapsPage': (context) => const MapsPage(),
    'bookmarksPage': (context) => const BookmarksPage(),
    'forgotPassword': (context) => const ForgotPasswordPage(),
    'profilePage': (context) => const ProfilePage(),
    'paymentsPage': (context) => const PaymentsMethodsPage(),
    'searchesPage': (context) => const SearchesPage()
  };
}
