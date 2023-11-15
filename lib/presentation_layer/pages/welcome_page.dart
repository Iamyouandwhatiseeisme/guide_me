// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import 'package:guide_me/business_layer/cubit/radio_button_cubit_cubit.dart';

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
        BlocProvider(
          create: (context) => RadioButtonCubitCubit(),
          child: Center(
            child: Builder(builder: (context) {
              return const Column(
                children: <Widget>[
                  SizedBox(
                    height: 40,
                  ),
                  AnimationWidget(
                    animatedWidget: TranzitioningLogo(),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  WelcomePageSlider(),
                  GetStartedButton()
                ],
              );
            }),
          ),
        ),
      ]),
    );
  }
}
