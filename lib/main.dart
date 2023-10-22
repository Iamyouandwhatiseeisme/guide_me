import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/bottom_navigation_bar_cubit.dart';

import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/data_layer/models/collection_model.dart';
import 'package:guide_me/data_layer/models/opening_hours.dart';
import 'package:guide_me/data_layer/provider/google_sign_in.dart';
import 'package:guide_me/presentation_layer/pages/first_page.dart';
import 'package:guide_me/presentation_layer/pages/maps_page.dart';
import 'package:guide_me/presentation_layer/pages/place_page.dart';
import 'package:guide_me/presentation_layer/widgets/custom_bottom_navigatio_bar_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'data_layer/models/nearby_places_model.dart';
import 'presentation_layer/pages/pages.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(NearbyPlacesModelAdapter());
  Hive.registerAdapter(OpeningHoursAdapter());
  Hive.registerAdapter(CollectionModelAdapter());
  await Hive.openBox<CollectionModel>('CollectionLists');
  await Hive.openBox<NearbyPlacesModel>('FavoritedPlaces');
  await requestWritePermission();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void dispose() {
    Hive.close();
  }

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
          // BlocProvider(
          //   create: (context) => FavoritesButtonCubit(),
          // )
        ],
        child: ChangeNotifierProvider(
          create: (context) => GoogleSignInprovider(),
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
              'authPage': (context) => const AuthPage(
                    bottomNavigationBar: bottomAppBar,
                    apiKey: apiKey,
                  ),
              'firstPage': (context) => const FirstPage(
                    bottomNavigationBar: bottomAppBar,
                    apiKey: apiKey,
                  ),
              'placePage': (context) => const PlacePage(),
              'seeAllPage': (context) => SeeAllPage(),
              'mapsPage': (context) => const MapsPage(
                    apiKey: apiKey,
                    customBottomAppBar: bottomAppBar,
                  ),
              'bookmarksPage': (context) => const BookmarksPage(
                    customBottomAppBar: bottomAppBar,
                    apiKey: apiKey,
                  ),
              'forgotPassword': (context) => const ForgotPasswordPage(),
            },
          ),
        ),
      );
    });
  }
}
