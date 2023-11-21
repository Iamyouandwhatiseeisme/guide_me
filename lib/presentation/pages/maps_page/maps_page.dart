// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guide_me/main.dart';

import 'package:guide_me/business_layer/cubit/go_to_my_location_cubit_cubit.dart';
import 'package:guide_me/business_layer/cubit/is_exapnded_cubit.dart';
import 'package:guide_me/business_layer/cubit/weather_cubit_cubit.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/presentation/pages/first_page/widgets/custom_bottom_navigatio_bar_widget.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  bool locationFetched = false;
  bool weatherFetched = false;

  late GoogleMapController? _controller;
  late Completer<GoogleMapController> _googleMapControllerCompleter;
  late Completer<String> _googleMapLocationCompleter;

  @override
  void initState() {
    super.initState();
    _googleMapControllerCompleter = Completer<GoogleMapController>();
    _googleMapLocationCompleter = Completer<String>();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final userLocation = sl.get<UserLocation>();

    return MultiBlocProvider(
        providers: [
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
          loadData(
              context: context,
              lat: userLocation.userLat,
              lon: userLocation.userLon,
              googleMapLocationCompleter: _googleMapLocationCompleter);

          return FutureBuilder(
              future: _googleMapLocationCompleter.future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const LoadingAnimationScaffold();
                } else {
                  if (snapshot.hasData) {
                    return Scaffold(
                      backgroundColor: Theme.of(context).colorScheme.background,
                      bottomNavigationBar: sl.get<CustomBottomNavigationBar>(),
                      appBar: PreferredSize(
                        preferredSize: const Size.fromHeight(48),
                        child: MapsPageAppBarWidget(
                          widget: widget,
                          temperature: weatherState.temperature!,
                        ),
                      ),
                      body: Stack(children: [
                        BlocBuilder<LocationCubit, UserLocation>(
                          builder: (context, userLocations) {
                            return GoogleMap(
                                zoomControlsEnabled: false,
                                onMapCreated: (GoogleMapController controller) {
                                  _controller = controller;
                                  _googleMapControllerCompleter
                                      .complete(_controller);
                                },
                                myLocationButtonEnabled: false,
                                myLocationEnabled: true,
                                mapType: MapType.terrain,
                                initialCameraPosition: CameraPosition(
                                    zoom: 18,
                                    target: LatLng(userLocation.userLat,
                                        userLocation.userLon)));
                          },
                        ),
                        FutureBuilder(
                            future: _googleMapControllerCompleter.future,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
                                if (snapshot.hasData) {
                                  return MapsPageContent(
                                      screenHeight: screenHeight,
                                      controller: _controller!,
                                      screenWidth: screenWidth);
                                } else {
                                  return const Text('No data');
                                }
                              } else if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const LoadingAnimationScaffold();
                              } else {
                                return const Text('Erro');
                              }
                            })
                      ]),
                    );
                  } else {
                    return const Text('No data');
                  }
                }
              });
        }));
  }
}
