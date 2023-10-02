// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guide_me/business_layer/cubit/is_exapnded_cubit.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:guide_me/business_layer/cubit/geolocator_cubit.dart';
import 'package:guide_me/business_layer/cubit/go_to_my_location_cubit_cubit.dart';
import 'package:guide_me/business_layer/cubit/weather_cubit_cubit.dart';
import 'package:guide_me/presentation_layer/widgets/custom_bottom_navigatio_bar_widget.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class MapsPage extends StatefulWidget {
  CustomBottomNavigationBar customBottomAppBar;
  late LocationDisplayWidget? locationDisplayWidget;
  late String? apiKey;
  MapsPage({
    Key? key,
    this.locationDisplayWidget,
    this.apiKey,
    required this.customBottomAppBar,
  }) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  bool locationFetched = false;
  bool weatherFetched = false;
  double lat = 0.0;
  double lon = 0.0;
  late GoogleMapController? _controller;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final listOfArguments =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    widget.apiKey = listOfArguments[0] as String;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GeolocatorCubit(),
        ),
        BlocProvider(
          create: (context) => WeatherCubit(),
        ),
        BlocProvider(
          create: (context) => LocationCubit(),
        ),
        BlocProvider(create: (context) => IsExapndedCubit())
      ],
      child: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, weatherState) {
          return BlocBuilder<GeolocatorCubit, LocationState>(
              builder: (context, state) {
            final geoLocatorCubit = BlocProvider.of<GeolocatorCubit>(context);
            geoLocatorCubit.getLocation();

            if (state is LocationLoaded) {
              final weatherCubit = BlocProvider.of<WeatherCubit>(context);

              lat = state.position.latitude;
              lon = state.position.longitude;
              weatherCubit.fetchWeather(lat, lon);

              return FutureBuilder(
                  future: Future.delayed(Duration(seconds: 2)),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Scaffold(
                          body: Center(
                              child: LoadingAnimationWidget.inkDrop(
                                  color: const Color(0xffC75E6B), size: 20)));
                    } else {
                      return Scaffold(
                        bottomNavigationBar: widget.customBottomAppBar,
                        appBar: PreferredSize(
                          preferredSize: const Size.fromHeight(48),
                          child: MapsPageAppBarWidget(
                            widget: widget,
                            temperature: weatherState.temperature!,
                          ),
                        ),
                        body: Stack(children: [
                          BlocBuilder<LocationCubit, LatLng>(
                            builder: (context, userLocation) {
                              return GoogleMap(
                                  zoomControlsEnabled: false,
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    _controller = controller;
                                  },
                                  myLocationButtonEnabled: false,
                                  myLocationEnabled: true,
                                  mapType: MapType.terrain,
                                  initialCameraPosition: CameraPosition(
                                      zoom: 18, target: LatLng(lat, lon)));
                            },
                          ),
                          FutureBuilder(
                              future: Future.delayed(Duration(seconds: 2)),
                              builder: (context, snapshot) {
                                return MapsPageContent(
                                    screenHeight: screenHeight,
                                    controller: _controller,
                                    lat: lat,
                                    lon: lon,
                                    screenWidth: screenWidth);
                              })
                        ]),
                      );
                    }
                  });
            } else if (state is LocationLoading) {
              return LoadingAnimationWidget.inkDrop(
                  color: const Color(0xffC75E6B), size: 20);
            } else {
              return const Text('Couldn\' retrieve location');
            }
          });
        },
      ),
    );
  }
}
