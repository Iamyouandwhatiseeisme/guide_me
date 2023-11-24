// import 'package:bloc/bloc.dart';


// import 'package:equatable/equatable.dart';


// import 'package:flutter/material.dart';


// import 'package:flutter_bloc/flutter_bloc.dart';


// import 'package:guide_me/bloc/cubits.dart';


// import 'package:guide_me/data/data.dart';


// import 'package:guide_me/main.dart';


// part 'initialize_first_page_data_state.dart';


// class InitializeFirstPageDataCubit extends Cubit<InitializeFirstPageDataState> {

//   InitializeFirstPageDataCubit() : super(InitializeFirstPageDataInitial());


//   final googleApiClient = sl<GoogleDataSource>();


//   void initalizeFirstPageData(

//       {required List<NearbyPlacesModel> listOfNearbyPlaces,

//       required List<NearbyPlacesModel> listOfSightseeingPlaces,

//       required List<NearbyPlacesModel> listPlacesForFood,

//       required LocationLoaded locationState,

//       required BuildContext context}) {

//     emit(InitializeFirstPageDataLoading());


//     final nearbyPlacesCubit = context.read<NearbyPlacesCubit>();


//     if (listOfNearbyPlaces.isEmpty) {

//       nearbyPlacesCubit.fetchNearbyPlaces(

//           listOfNearbyPlaces: listOfNearbyPlaces,

//           googleApiClient: googleApiClient);

//     }


//     final nearbySightSeeingCubit = context.read<NearbySightSeeingCubit>();


//     if (listOfSightseeingPlaces.isEmpty) {

//       nearbySightSeeingCubit.fetchNearbySightseeings(

//           listOfNearbySightseeings: listOfSightseeingPlaces,

//           googleApiClient: googleApiClient);

//     }


//     final whatToEatCubit = context.read<WhatToEatCubit>();


//     if (listPlacesForFood.isEmpty) {

//       whatToEatCubit.fetchPlacesForWhatToEat(

//           listOfpLacesForWhatToEat: listPlacesForFood,

//           googleApiClient: googleApiClient);

//     }


//     emit(InitializeFirstPageDataLoaded());

//   }

// }

