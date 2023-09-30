// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/data_layer/data.dart';

import '../../business_layer/cubit/geolocator_cubit.dart';
import '../../data_layer/reverse_geodecoder_method.dart';

class LocationDisplayWidget extends StatelessWidget {
  final String apiKey;
  const LocationDisplayWidget({
    Key? key,
    required this.apiKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String locationInfo = '';
    final geoLocatorCubit = BlocProvider.of<GeolocatorCubit>(context);
    geoLocatorCubit.getLocation();

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: const Color(
            0xffC75E6B,
          ),
          shape: BoxShape.rectangle),
      width: 250,
      height: 48,
      child: BlocBuilder<GeolocatorCubit, LocationState>(
          builder: (context, state) {
        if (state is LocationLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LocationLoaded) {
          double latitude = state.position.latitude;
          double longtitude = state.position.longitude;

          return FutureBuilder<String>(
              future: displayLocationInfoInWords(
                  latitude, longtitude, locationInfo, apiKey),
              builder: (context, snapshot) {
                // print(locationInfo);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Display a loading indicator while waiting for the location info

                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  // Handle errors if the future throws an exception
                  return Center(
                      child: Text('Location Error: ${snapshot.error}'));
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
              });
        } else if (state is LocationErorr) {
          // Handle location error
          return Center(
            child: Text('Location Error: ${state.message}'),
          );
        } else {
          return const Center(child: Text('Unexpected error'));
        }
      }),
    );
  }
}
