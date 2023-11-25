import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';
import 'package:guide_me/main.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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
    String category = listOfCategories[0];
    mapLoadedController = Completer<String>();
    final dataSource = sl.get<GoogleDataSource>();
    List<NearbyPlacesModel> listOfPlaces = [];
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryCubit()..updateCategory(category),
        ),
        BlocProvider(
          create: (context) => CategoryTypesFetcherCubit()
            ..fetchDataForCategories(
                listOfPlaces: listOfPlaces,
                category: category,
                googleApiClient: dataSource),
        ),
        BlocProvider(
          create: (context) => SortingCubit(),
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
                MultiBlocListener(
                  listeners: [
                    BlocListener<CategoryCubit, CategoryCubitState>(
                      listener: (context, state) {
                        final categoryTypesFetcherCubit =
                            BlocProvider.of<CategoryTypesFetcherCubit>(context);

                        if (state.wasChanged == true) {
                          List<NearbyPlacesModel> listOfPlaces = [];
                          category = state.selectedCategory;

                          categoryTypesFetcherCubit.fetchDataForCategories(
                              listOfPlaces: listOfPlaces,
                              category: category,
                              googleApiClient: dataSource);

                          mapLoadedController.complete('compelted');
                        }
                      },

                      // )
                    ),
                    BlocListener<CategoryTypesFetcherCubit,
                        CategoryTypesFetcherState>(
                      listener: (context, fetcherState) {
                        final sortingCubit =
                            BlocProvider.of<SortingCubit>(context);
                        if (fetcherState is CategoryTypesFetcherLoaded) {
                          cachedData[category] = fetcherState.listOfPlaces;

                          sortingCubit.createDistanceMap(
                            distanceMap: distanceMap,
                            listOfDestinations: cachedData[category]!,
                          );
                          mapLoadedController.complete('Completed');
                        }
                      },
                    ),
                  ],
                  child: BlocBuilder<CategoryCubit, CategoryCubitState>(
                      builder: (context, state) {
                    return BlocBuilder<CategoryTypesFetcherCubit,
                        CategoryTypesFetcherState>(
                      builder: (context, state) {
                        if (state is CategoryTypesFetcherLoaded &&
                            mapLoadedController.isCompleted) {
                          return FutureBuilderForAlistInMapsPageTypeView(
                              distanceMap: distanceMap,
                              dataFetchController: mapLoadedController,
                              listOfPlaces: cachedData[category]!);
                        } else {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 200,
                              ),
                              Center(
                                child: LoadingAnimationWidget.inkDrop(
                                    color: const Color(0xffC75E6B), size: 50),
                              ),
                            ],
                          );
                        }
                      },
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
