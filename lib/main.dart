import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:guide_me/bloc/cubits.dart';

import 'package:guide_me/presentation/themes/dark_theme.dart';
import 'package:guide_me/presentation/themes/light_theme.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'data/data.dart';
import 'presentation/widgets/navigation/navigator_client.dart';

// set up serviceLocator with GetIT package;
final sl = GetIt.instance;

Future<void> main() async {
  //initialize everything needed for startup
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  setUp();
  sl<FirebaseService>().initFirebase();
  sl<LocalDataSource>().initLocalDataBase();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

  // sets the current language of the application
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
    return Builder(
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => BottomNavigationBarCubit(),
            ),
            BlocProvider(
              create: (context) => GeolocatorCubit()..registerLocation(),
            ),
            BlocProvider(
              create: (context) => AuthStreamCubit()..init(),
            )
          ],
          child: ChangeNotifierProvider<ThemeProvider>(
            create: (BuildContext context) => ThemeProvider(),
            child: Builder(
              builder: (context) {
                return ChangeNotifierProvider(
                  create: (context) => GoogleSignInprovider(),
                  child: MaterialApp(
                      localizationsDelegates:
                          AppLocalizations.localizationsDelegates,
                      supportedLocales: AppLocalizations.supportedLocales,
                      locale: _locale,
                      debugShowCheckedModeBanner: false,
                      initialRoute: '/',
                      title: 'GuideMe',
                      theme: context.watch<ThemeProvider>().currentTheme ==
                              AppTheme.light
                          ? lightTheme
                          : darkTheme,
                      darkTheme: darkTheme,
                      routes: sl.get<NavigatorClient>().routes),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
