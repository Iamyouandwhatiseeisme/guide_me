import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/geolocator_cubit.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class FirstPageAppBar extends StatelessWidget {
  const FirstPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffF3F0E6),
      leadingWidth: 250,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: BlocProvider(
          create: (context) => GeolocatorCubit(),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color(
                  0xffC75E6B,
                ),
                shape: BoxShape.rectangle),
            width: 250,
            height: 48,
            child: const LocationDisplayWidget(),
          ),
        ),
      ),
    );
  }
}
