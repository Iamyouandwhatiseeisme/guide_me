import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomePageSlider extends StatelessWidget {
  const WelcomePageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RadioButtonCubitCubit, RadioButtonCubitInitial>(
      builder: (context, state) {
        return state.value == 0
            ? Column(
                children: [
                  BackgroundPhotoAndTitleWidget(
                      pageTitle: AppLocalizations.of(context)!
                          .welcomePageFirstSlideText,
                      photo: 'assets/images/Navigation-amico (1) 2.png'),
                  const RadioButtonWidget(
                    firstButton: 'assets/buttons/Rectangle 7.png',
                    secondButton: 'assets/buttons/Rectangle 8.png',
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
                          firstButton: 'assets/buttons/Rectangle 8.png',
                          secondButton: 'assets/buttons/Rectangle 7.png',
                          thirdButton: 'assets/buttons/Rectangle 8.png'),
                    ],
                  )
                : Column(
                    children: [
                      BackgroundPhotoAndTitleWidget(
                          pageTitle: AppLocalizations.of(context)!
                              .welcomePageThirdSlideText,
                          photo: 'assets/images/Modern life-cuate (1) 1.png'),
                      const SizedBox(height: 30),
                      const RadioButtonWidget(
                          firstButton: 'assets/buttons/Rectangle 8.png',
                          secondButton: 'assets/buttons/Rectangle 8.png',
                          thirdButton: 'assets/buttons/Rectangle 7.png'),
                    ],
                  );
      },
    );
  }
}
