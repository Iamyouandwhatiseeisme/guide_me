import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guide_me/presentation_layer/pages/first_page.dart';
import 'presentation_layer/pages/pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Telegraf',
        primaryColor: Color(0xffF3F0E6),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromARGB(255, 243, 229, 182),
            brightness: Brightness.light),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => WelcomePage(
            backGroundPhoto: 'assets/images/Navigation-amico (1) 2.png'),
        'authPage': (context) => AuthPage(),
        'firstPage': (context) => firstPage()
      },
    );
  }
}
