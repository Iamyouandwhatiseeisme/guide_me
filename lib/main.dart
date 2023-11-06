import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/bottom_navigation_bar_cubit.dart';
import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/data_layer/models/collection_model.dart';
import 'package:guide_me/data_layer/models/opening_hours.dart';
import 'package:guide_me/data_layer/provider/google_sign_in.dart';
import 'package:guide_me/presentation_layer/themes/dark_theme.dart';
import 'package:guide_me/presentation_layer/themes/light_theme.dart';
import 'package:guide_me/presentation_layer/widgets/custom_bottom_navigatio_bar_widget.dart';
import 'data_layer/enums/app_theme.dart';
import 'data_layer/provider/theme_provider.dart';
import 'presentation_layer/pages/pages.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'data_layer/models/nearby_places_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
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
        ],
        child: ChangeNotifierProvider<ThemeProvider>(
          create: (BuildContext context) => ThemeProvider(),
          child: Builder(builder: (context) {
            return ChangeNotifierProvider(
              create: (context) => GoogleSignInprovider(),
              child: MaterialApp(
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: _locale,
                debugShowCheckedModeBanner: false,
                initialRoute: '/',
                title: 'Flutter Demo',
                theme: context.watch<ThemeProvider>().currentTheme ==
                        AppTheme.light
                    ? lightTheme
                    : darkTheme,
                darkTheme: darkTheme,
                routes: {
                  '/': (context) => const WelcomePage(
                      backGroundPhoto:
                          'assets/images/Navigation-amico (1) 2.png'),
                  'authPage': (context) => const AuthPage(
                        bottomNavigationBar: bottomAppBar,
                        apiKey: apiKey,
                      ),
                  'firstPage': (context) => const FirstPage(
                        bottomNavigationBar: bottomAppBar,
                        apiKey: apiKey,
                      ),
                  'placePage': (context) => const PlacePage(),
                  'seeAllPage': (context) => const SeeAllPage(),
                  'mapsPage': (context) => const MapsPage(
                        apiKey: apiKey,
                        customBottomAppBar: bottomAppBar,
                      ),
                  'bookmarksPage': (context) => const BookmarksPage(
                        customBottomAppBar: bottomAppBar,
                        apiKey: apiKey,
                      ),
                  'forgotPassword': (context) => const ForgotPasswordPage(),
                  'profilePage': (context) => const ProfilePage(),
                  'paymentsPage': (context) => const PaymentsMethodsPage()
                },
              ),
            );
          }),
        ),
      );
    });
  }
}
