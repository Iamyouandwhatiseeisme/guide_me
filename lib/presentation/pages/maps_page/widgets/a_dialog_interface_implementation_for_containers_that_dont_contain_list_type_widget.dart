import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/data/data.dart';

import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';

class ADialogWithoutListOfCategories extends BuildADialogOnMapsWindowWidget {
  const ADialogWithoutListOfCategories({
    super.key,
    required super.textLabel,
    required super.iconToDisplay,
    required super.screenHeight,
    required super.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    late Completer<String> dataFetchController;

    dataFetchController = Completer<String>();
    List<NearbyPlacesModel> listOfPlaces = [];
    Map<NearbyPlacesModel, double?> distanceMap = {};

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SortingCubit(),
          ),
          BlocProvider(
            create: (context) => CategoryTypesFetcherCubit()
              ..createList(
                  distanceMap: distanceMap,
                  category: textLabel,
                  sortingCubit: BlocProvider.of<SortingCubit>(context),
                  listOfPlaces: listOfPlaces,
                  listLoaderController: dataFetchController),
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
                const SizedBox(
                  height: 36,
                ),
                BlocBuilder<CategoryTypesFetcherCubit,
                    CategoryTypesFetcherState>(builder: (context, state) {
                  // String category = textLabel;
                  // final categoryTypesFetcherCubit =
                  //     BlocProvider.of<CategoryTypesFetcherCubit>(context);
                  // final sortingCubit = BlocProvider.of<SortingCubit>(context);
                  // sl.get<GoogleDataSource>().createList(
                  //     sortingCubit: sortingCubit,
                  //     distanceMap: distanceMap,
                  //     category: category,
                  //     categoryTypesFetcherCubit: categoryTypesFetcherCubit,
                  //     listOfPlaces: listOfPlaces,
                  //     listLoaderController: dataFetchController);

                  return FutureBuilderForAlistInMapsPageTypeView(
                      distanceMap: distanceMap,
                      dataFetchController: dataFetchController,
                      listOfPlaces: listOfPlaces);
                })
              ],
            ),
          ),
        ));
  }
}
