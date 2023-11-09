// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import '../../pages/maps_page.dart';

class MapsPageAppBarWidget extends StatelessWidget {
  final String temperature;
  const MapsPageAppBarWidget({
    Key? key,
    required this.temperature,
    required this.widget,
  }) : super(key: key);

  final MapsPage widget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      leadingWidth: 200,
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Container(
              width: 150,
              child: Row(
                children: [
                  Container(
                    width: 105,
                    height: 36,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: const Color(0xff292F32).withOpacity(0.75)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                              alignment: Alignment.topCenter,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 2.0, right: 1),
                                child: Image.asset('assets/images/Weather.png'),
                              )),
                          Text('$temperature°C',
                              style: const TextStyle(
                                  color: Color(0xffF3F0E6),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const MenuExpandButtonWidget(),
                ],
              ),
            ))
      ],
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: LocationDisplayWidget(apiKey: widget.apiKey),
      ),
    );
  }
}
