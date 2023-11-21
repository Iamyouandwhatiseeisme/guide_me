// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:guide_me/data/data.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../main.dart';

class LocationDisplayWidget extends StatelessWidget {
  const LocationDisplayWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String locationInfo = '';

    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: const Color(
              0xffC75E6B,
            ),
            shape: BoxShape.rectangle),
        width: 250,
        height: 48,
        child: FutureBuilder<String>(
            future: sl.get<GeocodingUtil>().displayLocationInfoInWords(
                  locationInfo,
                ),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Display a loading indicator while waiting for the location info

                return LoadingAnimationWidget.inkDrop(
                    color: const Color.fromARGB(255, 210, 203, 204), size: 20);
              } else if (snapshot.hasError) {
                // Handle errors if the future throws an exception
                return Center(child: Text('Location Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    Image.asset('assets/images/LocationLogo.png'),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      snapshot.data!,
                      style: const TextStyle(
                          fontFamily: 'Telegraf',
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: Color(0xffF3F0E6)),
                    ),
                  ]),
                );
              } else {
                return const Text('oops');
              }
            }));
  }
}
