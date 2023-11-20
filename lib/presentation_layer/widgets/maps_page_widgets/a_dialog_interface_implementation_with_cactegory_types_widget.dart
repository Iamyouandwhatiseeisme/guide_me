import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/data_layer/data.dart';
import 'package:guide_me/data_layer/httpClients/google_api_client.dart';
import 'package:guide_me/data_layer/models/nearby_places_model.dart';
import 'package:guide_me/main.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class ADialogWithInterfaceListCategories
    extends BuildADialogOnMapsWindowWidget {
  final List<String> listOfCategories;

  const ADialogWithInterfaceListCategories({
    super.key,
    required super.textLabel,
    required this.listOfCategories,
    required super.iconToDisplay,
    required super.screenHeight,
    required super.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    late Completer<String> mapLoadedController;
    final Map<String, List<NearbyPlacesModel>> cachedData = {};
    Map<NearbyPlacesModel, double?> distanceMap = {};

    mapLoadedController = Completer<String>();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit(),
        ),
        BlocProvider(
          create: (context) => CategoryTypesFetcherCubit(),
        ),
      ],
      child: Dialog(
        insetPadding: const EdgeInsets.all(0),
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xff292F32),
              borderRadius: BorderRadius.circular(16)),
          height: screenHeight - 136,
          width: screenWidth,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconToDisplay,
                      Text(
                        textLabel,
                        style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 24,
                            color: Color(0xffF3F0E6)),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: const Color(0xffF3F0E6).withOpacity(0.25),
                          ),
                          child: const Icon(
                            Icons.close_rounded,
                            color: Color(0xffF3F0E6),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 36),
                OtherCategoryTypesRowWidget(listOfCategories: listOfCategories),
                BlocBuilder<CategoryTypesFetcherCubit,
                    CategoryTypesFetcherState>(
                  builder: (context, state) {
                    List<NearbyPlacesModel> listOfPlaces = [];
                    return BlocBuilder<CategoryCubit, CategoryCubitState>(
                      builder: (context, state) {
                        return Builder(builder: (BuildContext context) {
                          String category = state.selectedCategory;
                          final categoryTypesFetcherCubit =
                              BlocProvider.of<CategoryTypesFetcherCubit>(
                                  context);
                          sl.get<GoogleApiClient>().createMap(
                              cachedData,
                              category,
                              categoryTypesFetcherCubit,
                              listOfPlaces,
                              mapLoadedController);
                          createDistanceMap(
                            distanceMap,
                            cachedData[category]!,
                          );

                          return FutureBuilderForAlistInMapsPageTypeView(
                              distanceMap: distanceMap,
                              dataFetchController: mapLoadedController,
                              listOfPlaces: cachedData[category]!);
                        });
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
