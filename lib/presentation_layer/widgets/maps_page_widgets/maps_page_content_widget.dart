// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:guide_me/business_layer/cubit/is_exapnded_cubit.dart';
import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class MapsPageContent extends StatelessWidget {
  const MapsPageContent({
    Key? key,
    required this.apiKey,
    required this.screenHeight,
    required this.controller,
    required this.lat,
    required this.lon,
    required this.screenWidth,
  }) : super(key: key);

  final String apiKey;
  final double screenHeight;
  final GoogleMapController controller;
  final double lat;
  final double lon;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    List<MapItem> mapItemListForRowOne = [];
    List<MapItem> mapItemListForRowTwo = [];
    List<String> listOfCategories = [];
    createLists(mapItemListForRowOne, mapItemListForRowTwo, listOfCategories);

    return BlocBuilder<IsExapndedCubit, bool>(
      builder: (context, state) {
       
        return state == false
            ? Container()
            
            : IfMenuExpanded(
                screenHeight: screenHeight,
                controller: controller,
                lat: lat,
                lon: lon,
                listOfCategories: listOfCategories,
                apiKey: apiKey,
                mapItemListForRowOne: mapItemListForRowOne,
                screenWidth: screenWidth,
                mapItemListForRowTwo: mapItemListForRowTwo);
      },
    );
  }
}
