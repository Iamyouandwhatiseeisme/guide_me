import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/bottom_navigation_bar_cubit.dart';
import 'package:guide_me/business_layer/cubit/favorites_button_cubit.dart';
import 'package:guide_me/presentation_layer/pages/first_page.dart';
import 'package:guide_me/presentation_layer/pages/maps_page.dart';
import 'package:guide_me/presentation_layer/pages/place_page.dart';
import 'package:guide_me/presentation_layer/widgets/custom_bottom_navigatio_bar_widget.dart';
import 'presentation_layer/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      const String apiKey = 'AIzaSyDzW8mtXzGKSfoNPDrdPFbDomkmpBRGK9c';
      const bottomAppBar = CustomBottomNavigationBar(
        apiKey: apiKey,
      );
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => BottomNavigationBarCubit(),
          ),
          BlocProvider(
            create: (context) => FavoritesCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          title: 'Flutter Demo',
          theme: ThemeData(
            fontFamily: 'Telegraf',
            primaryColor: const Color(0xffF3F0E6),
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 243, 229, 182),
                brightness: Brightness.light),
            useMaterial3: true,
          ),
          routes: {
            '/': (context) => const WelcomePage(
                backGroundPhoto: 'assets/images/Navigation-amico (1) 2.png'),
            'authPage': (context) => const AuthPage(),
            'firstPage': (context) => const FirstPage(
                  bottomNavigationBar: bottomAppBar,
                  apiKey: apiKey,
                ),
            'placePage': (context) => const PlacePage(),
            'seeAllPage': (context) => SeeAllPage(),
            'mapsPage': (context) => MapsPage(
                  apiKey: apiKey,
                  customBottomAppBar: bottomAppBar,
                ),
            'bookmarksPage': (context) =>
                const BookmarksPage(customBottomAppBar: bottomAppBar)
          },
        ),
      );
    });
  }
}
