import 'package:flutter/material.dart';

import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

import '../../../../data/data.dart';

class WelcomePageSlider extends StatefulWidget {
  const WelcomePageSlider({
    super.key,
  });

  @override
  State<WelcomePageSlider> createState() => _WelcomePageSliderState();
}

class _WelcomePageSliderState extends State<WelcomePageSlider> {
  List<String> images = [
    'Navigation-amico (1) 2.png',
    'Location review-amico (1) 1.png',
    'Modern life-cuate (1) 1.png'
  ];

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      translation(context).discoverTheBestOfEachCity,
      translation(context).createYourOwnAdventure,
      translation(context).stayUpToDate
    ];
    return SizedBox(
      height: 465,
      width: 600,
      child: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (_, index) {
          return Column(
            children: [
              BackgroundPhotoAndTitleWidget(
                  pageTitle: titles[index], photo: images[index]),
              SliderDots(
                index: index,
              ),
            ],
          );
        },
      ),
    );
  }
}
