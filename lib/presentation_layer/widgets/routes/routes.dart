import 'package:flutter/material.dart';

import '../../pages/pages.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (context) => const WelcomePage(
      backGroundPhoto: 'assets/images/Navigation-amico (1) 2.png'),
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
