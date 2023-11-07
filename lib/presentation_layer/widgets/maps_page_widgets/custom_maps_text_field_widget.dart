import 'package:flutter/widgets.dart';

class CustomMapsTextField extends StatelessWidget {
  const CustomMapsTextField({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth - 32,
      height: 48,
      // child: CustomTextFormField(
      //   textColor: const Color(0xffF3F0E6),
      //   radiusSize: 16,
      //   color: const Color(0xff292F32).withOpacity(0.75),
      // ),
    );
  }
}
