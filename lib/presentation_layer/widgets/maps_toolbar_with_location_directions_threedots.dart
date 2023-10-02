import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../business_layer/cubits.dart';

class MapsToolbarWIthDirectionsLocationAndThreeDotsWidget
    extends StatelessWidget {
  GoogleMapController? controller;
  final LatLng userLocation;
  MapsToolbarWIthDirectionsLocationAndThreeDotsWidget({
    super.key,
    this.controller,
    required this.userLocation,
  });

  @override
  Widget build(BuildContext context) {
    final locationCubit = context.read<LocationCubit>();

    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
          width: screenWidth - 32 - 127,
          height: 48,
        ),
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Color(0xff292F32).withOpacity(0.75)),
            width: 127,
            height: 48,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () => locationCubit.goToMyLocation(
                          controller, userLocation),
                      child: Image.asset('assets/images/Arrow.png')),
                  Icon(
                    Icons.directions_outlined,
                    color: Color(0xffF3F0E6),
                  ),
                  Icon(
                    Icons.more_horiz,
                    color: Color(0xffF3F0E6),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
