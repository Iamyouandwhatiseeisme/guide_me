import 'package:flutter/material.dart';

import '../../pages/pages.dart';
// a routes map for the navigation that contains all the pages in the app

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
