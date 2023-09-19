import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/geolocator_cubit.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

import 'dart:convert';
import 'package:http/http.dart';

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  List<NearbyPlacesModel> listOfNearbyPlaces = [];
  @override
  void initState() {
    super.initState();
    fetchData(listOfNearbyPlaces);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 40),
      child: Scaffold(
        backgroundColor: Color(0xffF3F0E6),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: AppBar(
            backgroundColor: Color(0xffF3F0E6),
            leadingWidth: 250,
            leading: Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: BlocProvider(
                create: (context) => GeolocatorCubit(),
                child: Container(
                  child: LocationDisplayWidget(),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color(
                        0xffC75E6B,
                      ),
                      shape: BoxShape.rectangle),
                  width: 250,
                  height: 48,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 36),
                child: TextFormField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xffFFFFFF),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide.none,
                      ),
                      hintText: 'Search for activity, location etc.'),
                ),
              ),
              recommended_places_card_builder(
                  listOfNearbyPlaces: listOfNearbyPlaces),
            ],
          ),
        ),
      ),
    );
  }
}
