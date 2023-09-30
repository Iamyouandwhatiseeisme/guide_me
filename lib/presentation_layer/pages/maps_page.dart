// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:guide_me/business_layer/cubit/geolocator_cubit.dart';
import 'package:guide_me/presentation_layer/widgets/location_display_widget.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    double lat;
    double lon;
    final listOfArguments =
        ModalRoute.of(context)!.settings.arguments as List<dynamic>;
    widget.apiKey = listOfArguments[0] as String;
    return BlocProvider(
      create: (context) => GeolocatorCubit(),
      child: BlocBuilder<GeolocatorCubit, LocationState>(
          builder: (context, state) {
        final geoLocatorCubit = BlocProvider.of<GeolocatorCubit>(context);
        geoLocatorCubit.getLocation();
        if (state is LocationLoaded) {
          lat = state.position.latitude;
          lon = state.position.longitude;
          print('$lat, $lon');

          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(48),
              child: MapsPageAppBarWidget(widget: widget),
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
      }),
    );
  }
}
