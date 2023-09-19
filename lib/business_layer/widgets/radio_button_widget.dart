import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/business_layer/cubit/radio_button_cubit_cubit.dart';

class RadioButtonWidget extends StatelessWidget {
  final String firstButton;
  final String secondButton;
  final String thirdButton;
  const RadioButtonWidget({
    Key? key,
    required this.firstButton,
    required this.secondButton,
    required this.thirdButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 8,
        width: 52,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: GestureDetector(
                  onTap: () => BlocProvider.of<RadioButtonCubitCubit>(context)
                      .selectRadioButton(0),
                  child: Image.asset(firstButton)),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 6.0),
              child: GestureDetector(
                  onTap: () => BlocProvider.of<RadioButtonCubitCubit>(context)
                      .selectRadioButton(1),
                  child: Image.asset(secondButton)),
            ),
            GestureDetector(
                onTap: () => BlocProvider.of<RadioButtonCubitCubit>(context)
                    .selectRadioButton(2),
                child: Image.asset(thirdButton))
          ],
        ));
  }
}
