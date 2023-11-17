import 'package:flutter/material.dart';

class SliderDots extends StatelessWidget {
  final int index;
  const SliderDots({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (indexDots) {
          return Padding(
            padding: const EdgeInsets.only(right: 6),
            child: Container(
                width: index == indexDots ? 25 : 8,
                height: 8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: index == indexDots
                        ? const Color(0xffF4C871)
                        : Colors.white)),
          );
        },
      ),
    );
  }
}
