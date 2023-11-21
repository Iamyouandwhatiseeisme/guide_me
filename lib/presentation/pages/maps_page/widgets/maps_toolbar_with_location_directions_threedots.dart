import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/main.dart';

import '../../../../bloc/cubits.dart';

class MapsToolbarWIthDirectionsLocationAndThreeDotsWidget
    extends StatefulWidget {
  final GoogleMapController controller;

  const MapsToolbarWIthDirectionsLocationAndThreeDotsWidget({
    super.key,
    required this.controller,
  });

  @override
  State<MapsToolbarWIthDirectionsLocationAndThreeDotsWidget> createState() =>
      _MapsToolbarWIthDirectionsLocationAndThreeDotsWidgetState();
}

class _MapsToolbarWIthDirectionsLocationAndThreeDotsWidgetState
    extends State<MapsToolbarWIthDirectionsLocationAndThreeDotsWidget> {
  @override
  @override
  Widget build(BuildContext context) {
    final locationCubit = context.read<LocationCubit>();

    double screenWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<IsExapndedCubit, bool>(
      builder: (context, state) {
        return Row(
          children: [
            SizedBox(
              width: state == true
                  ? screenWidth - 32 - 180
                  : screenWidth - 32 - 127,
              height: 48,
            ),
            Column(
              children: [
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: const Color(0xff292F32).withOpacity(0.75)),
                    width: state == true ? 180 : 127,
                    height: state == true ? 180 : 48,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 12.0, right: 12, top: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                final UserLocation userLocation =
                                    sl.get<UserLocation>();
                                locationCubit.goToMyLocation(
                                    controller: widget.controller,
                                    myLocation: userLocation);
                              },
                              child: Image.asset('assets/images/Arrow.png')),
                          const Icon(
                            Icons.directions_outlined,
                            color: Color(0xffF3F0E6),
                          ),
                          GestureDetector(
                            onTap: () =>
                                BlocProvider.of<IsExapndedCubit>(context)
                                    .toggleExpansion(),
                            child: const Icon(
                              Icons.more_horiz,
                              color: Color(0xffF3F0E6),
                            ),
                          )
                        ],
                      ),
                    )),
              ],
            ),
          ],
        );
      },
    );
  }
}
