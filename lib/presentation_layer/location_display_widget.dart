import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../business_layer/cubit/geolocator_cubit.dart';
import '../data_layer/reverse_geodecoder_method.dart';

class LocationDisplayWidget extends StatelessWidget {
  const LocationDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    String locationInfo = '';
    final geoLocatorCubit = BlocProvider.of<GeolocatorCubit>(context);
    final currentLocation = geoLocatorCubit.getLocation();

    return BlocBuilder<GeolocatorCubit, LocationState>(
        builder: (context, state) {
      final geoDecoder = GeocodingUtil();
      Future<String> _displayLocationInfoInWords(latitude, longtitude) async {
        final updatedLocationInfo =
            await GeocodingUtil.reverseGeocode(latitude, longtitude);

        locationInfo = updatedLocationInfo;
        return locationInfo;
      }

      if (state is LocationLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is LocationLoaded) {
        double latitude = state.position.latitude;
        double longtitude = state.position.longitude;

        return FutureBuilder<String>(
            future: _displayLocationInfoInWords(latitude, longtitude),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Display a loading indicator while waiting for the location info

                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // Handle errors if the future throws an exception
                return Center(child: Text('Location Error: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(children: [
                    Image.asset('assets/images/LocationLogo.png'),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      locationInfo,
                      style: TextStyle(
                          fontFamily: 'Telegraf',
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                          color: Color(0xffF3F0E6)),
                    ),
                  ]),
                );
              } else {
                return Text('oops');
              }
            });
      } else if (state is LocationErorr) {
        // Handle location error
        return Center(
          child: Text('Location Error: ${state.message}'),
        );
      } else {
        return Center(child: Text('Unexpected error'));
      }
    });
  }
}
