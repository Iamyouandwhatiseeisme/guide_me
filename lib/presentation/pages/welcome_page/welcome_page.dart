// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:guide_me/data/constants/language_constants.dart';

import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

import '../../widgets/navigation/navigator_client.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({
    super.key,
  });

  @override
  State<WelcomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffA3C3DB),
      body: Stack(children: <Widget>[
        Image.asset('assets/images/Ellipse 12.png'),
        Center(
          child: Builder(builder: (context) {
            return Column(
              children: <Widget>[
                const SizedBox(
                  height: 40,
                ),
                const AnimationWidget(
                  animatedWidget: TranzitioningLogo(),
                ),
                const SizedBox(
                  height: 40,
                ),
                const WelcomePageSlider(),
                RedButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(NavigatorClient.authPage),
                    label: translation(context).getStarted)
              ],
            );
          }),
        ),
      ]),
    );
  }
}
