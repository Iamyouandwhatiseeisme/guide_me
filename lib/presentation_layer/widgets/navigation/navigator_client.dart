import 'package:flutter/material.dart';
import 'package:guide_me/business_layer/cubit/bottom_navigation_bar_cubit.dart';
import 'package:guide_me/presentation_layer/pages/pages.dart';

class NavigatorClient {
  static const String welcomePage = '/';
  static const String authPage = 'authPage';
  static const String firstPage = 'firstPage';
  static const String placePage = 'placePage';
  static const String seeAllPage = 'seeAllPage';
  static const String mapsPage = 'mapsPage';
  static const String bookmarksPage = 'bookmarksPage';
  static const String forgotPassword = 'forgotPassword';
  static const String profilePage = 'profilePage';
  static const String searchesPage = 'searchesPage';
  void pushPage(
      {required BottomNavigationBarCubit bottomNavigationCubit,
      required int index,
      required List<String> screens,
      required String currentPage,
      required BuildContext context}) {
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
    welcomePage: (context) => const WelcomePage(),
    authPage: (context) => const AuthPage(),
    firstPage: (context) => const FirstPage(),
    placePage: (context) => const PlacePage(),
    seeAllPage: (context) => const SeeAllPage(),
    mapsPage: (context) => const MapsPage(),
    bookmarksPage: (context) => const BookmarksPage(),
    forgotPassword: (context) => const ForgotPasswordPage(),
    profilePage: (context) => const ProfilePage(),
    searchesPage: (context) => const SearchesPage()
  };
}
