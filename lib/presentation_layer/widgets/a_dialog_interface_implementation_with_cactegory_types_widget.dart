import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubits.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class ADialogWithInterfaceListCategories
    extends BuildADialogOnMapsWindowWidget {
  List<String> listOfCategories;
  ADialogWithInterfaceListCategories(
      {super.key, required super.textLabel,
      required this.listOfCategories,
      required super.iconToDisplay,
      required super.screenHeight,
      required super.screenWidth});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
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
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 25),
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
              OtherCategoryTypesRowWidget(listOfCategories: listOfCategories)
            ],
          ),
        ),
      ),
    );
  }
}
