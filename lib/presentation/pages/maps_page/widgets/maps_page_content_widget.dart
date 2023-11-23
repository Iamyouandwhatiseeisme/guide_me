// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:guide_me/bloc/cubits.dart';

import 'package:guide_me/data/data.dart';

import 'package:guide_me/main.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class MapsPageContent extends StatefulWidget {
  const MapsPageContent({
    Key? key,
    required this.screenHeight,
    required this.controller,
    required this.screenWidth,
  }) : super(key: key);

  final double screenHeight;
  final GoogleMapController controller;

  final double screenWidth;

  @override
  State<MapsPageContent> createState() => _MapsPageContentState();
}

class _MapsPageContentState extends State<MapsPageContent> {
  List<GoogleMapsPageCategoryItem> mapItemListForRowOne = [];
  List<GoogleMapsPageCategoryItem> mapItemListForRowTwo = [];
  List<String> listOfCategories = [];
  @override
  void initState() {
    sl.get<GoogleDataSource>().createLists(
        mapItemListForRowOne: mapItemListForRowOne,
        mapItemListForRowTwo: mapItemListForRowTwo,
        categoryList: listOfCategories);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IsExapndedCubit, bool>(
      builder: (context, state) {
        return state == false
            ? Container()
            : IfMenuExpanded(
                screenHeight: widget.screenHeight,
                controller: widget.controller,
                listOfCategories: listOfCategories,
                mapItemListForRowOne: mapItemListForRowOne,
                screenWidth: widget.screenWidth,
                mapItemListForRowTwo: mapItemListForRowTwo);
      },
    );
  }
}
