import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsListView extends StatelessWidget {
  const SettingsListView({
    super.key,
    required this.listofIcons,
    required this.listOfSettings,
    required this.index,
  });

  final List<FaIcon> listofIcons;
  final List<String> listOfSettings;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 300,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      (listofIcons[index]),
                      Padding(
                          padding: const EdgeInsets.only(
                            left: 20.0,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  listOfSettings[index],
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                              ])),
                    ]),
              ),
            ],
          ),
        ),
        Container(
          height: 0.5,
          decoration:
              BoxDecoration(color: const Color(0xff292F32).withOpacity(0.5)),
        )
      ],
    );
  }
}
