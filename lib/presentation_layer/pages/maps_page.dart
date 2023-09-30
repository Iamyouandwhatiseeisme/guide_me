// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:guide_me/business_layer/cubit/geolocator_cubit.dart';
import 'package:guide_me/business_layer/cubit/weather_cubit_cubit.dart';
import 'package:guide_me/presentation_layer/widgets/location_display_widget.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../data_layer/http_fetch_current_temperature.dart';

class MapsPage extends StatefulWidget {
  late LocationDisplayWidget? locationDisplayWidget;
  late String? apiKey;
  MapsPage({
    Key? key,
    this.locationDisplayWidget,
    this.apiKey,
  }) : super(key: key);

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  bool locationFetched = false;
  bool weatherFetched = false;
  double lat = 0.0;
  double lon = 0.0;
  @override
  Widget build(BuildContext context) {
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

              return Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(48),
                  child: MapsPageAppBarWidget(
                    widget: widget,
                    temperature: weatherState.temperature!,
                  ),
                ),
                body: GoogleMap(
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    mapType: MapType.terrain,
                    initialCameraPosition:
                        CameraPosition(zoom: 18, target: LatLng(lat, lon))),
              );
            } else if (state is LocationLoading) {
              return LoadingAnimationWidget.inkDrop(
                  color: Color(0xffC75E6B), size: 20);
            } else
              return Text('Couldn\' retrieve location');
          });
        },
      ),
    );
  }
}
