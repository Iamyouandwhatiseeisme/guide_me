// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/widgets/business_widgets.dart';
import 'dart:math' as math;
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import 'package:guide_me/business_layer/cubit/radio_button_cubit_cubit.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key, required this.backGroundPhoto});

  final String backGroundPhoto;

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
              return Column(
                children: <Widget>[
                  const SizedBox(
                    height: 40,
                  ),
                  const AnimationWidget(
                    animatedWidget: RotatingLogo(),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  BlocBuilder<RadioButtonCubitCubit, RadioButtonCubitInitial>(
                    builder: (context, state) {
                      return state.value == 0
                          ? Column(
                              children: [
                                BackgroundPhotoAndTitleWidget(
                                    pageTitle: AppLocalizations.of(context)!
                                        .welcomePageFirstSlideText,
                                    photo:
                                        'assets/images/Navigation-amico (1) 2.png'),
                                const RadioButtonWidget(
                                  firstButton: 'assets/buttons/Rectangle 7.png',
                                  secondButton:
                                      'assets/buttons/Rectangle 8.png',
                                  thirdButton: 'assets/buttons/Rectangle 8.png',
                                ),
                              ],
                            )
                          : state.value == 1
                              ? Column(
                                  children: [
                                    BackgroundPhotoAndTitleWidget(
                                        pageTitle: AppLocalizations.of(context)!
                                            .welcomePageSecondSlideText,
                                        photo:
                                            'assets/images/Location review-amico (1) 1.png'),
                                    const RadioButtonWidget(
                                        firstButton:
                                            'assets/buttons/Rectangle 8.png',
                                        secondButton:
                                            'assets/buttons/Rectangle 7.png',
                                        thirdButton:
                                            'assets/buttons/Rectangle 8.png'),
                                  ],
                                )
                              : Column(
                                  children: [
                                    BackgroundPhotoAndTitleWidget(
                                        pageTitle: AppLocalizations.of(context)!
                                            .welcomePageThirdSlideText,
                                        photo:
                                            'assets/images/Modern life-cuate (1) 1.png'),
                                    const SizedBox(height: 30),
                                    const RadioButtonWidget(
                                        firstButton:
                                            'assets/buttons/Rectangle 8.png',
                                        secondButton:
                                            'assets/buttons/Rectangle 8.png',
                                        thirdButton:
                                            'assets/buttons/Rectangle 7.png'),
                                  ],
                                );
                    },
                  ),
                  const GetStartedButton()
                ],
              );
            }),
          ),
        ),
      ]),
    );
  }
}
