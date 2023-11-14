import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/business_layer/cubit/bottom_navigation_bar_cubit.dart';

import 'package:guide_me/data_layer/firebase_service.dart';
import 'package:guide_me/data_layer/localDataBase/local_data_base.dart';

import 'package:guide_me/data_layer/provider/google_sign_in.dart';
import 'package:guide_me/data_layer/servie_locator.dart';
import 'package:guide_me/presentation_layer/pages/searches_page.dart';
import 'package:guide_me/presentation_layer/themes/dark_theme.dart';
import 'package:guide_me/presentation_layer/themes/light_theme.dart';
import 'package:guide_me/presentation_layer/widgets/first_page_widgets/custom_bottom_navigatio_bar_widget.dart';
import 'data_layer/constants/language_constants.dart';
import 'data_layer/enums/app_theme.dart';
import 'data_layer/provider/theme_provider.dart';
import 'presentation_layer/pages/pages.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final sl = ServiceLocator();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  sl.setUp();
  sl.sl<FirebaseService>().initFirebase();
  sl.sl<LocalDataBase>().initLocalDataBase();

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
  void didChangeDependencies() {
    getLocale().then((locale) => {setLocale(locale)});
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      String apiKey = dotenv.env['GOOGLE_API_KEY']!;
      CustomBottomNavigationBar bottomAppBar = CustomBottomNavigationBar(
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
                  'authPage': (context) => AuthPage(
                        bottomNavigationBar: bottomAppBar,
                        apiKey: apiKey,
                      ),
                  'firstPage': (context) => FirstPage(
                        bottomNavigationBar: bottomAppBar,
                        apiKey: apiKey,
                      ),
                  'placePage': (context) => const PlacePage(),
                  'seeAllPage': (context) => const SeeAllPage(),
                  'mapsPage': (context) => MapsPage(
                        apiKey: apiKey,
                        customBottomAppBar: bottomAppBar,
                      ),
                  'bookmarksPage': (context) => BookmarksPage(
                        customBottomAppBar: bottomAppBar,
                        apiKey: apiKey,
                      ),
                  'forgotPassword': (context) => const ForgotPasswordPage(),
                  'profilePage': (context) => const ProfilePage(),
                  'paymentsPage': (context) => const PaymentsMethodsPage(),
                  'searchesPage': (context) => const SearchesPage()
                },
              ),
            );
          }),
        ),
      );
    });
  }
}
