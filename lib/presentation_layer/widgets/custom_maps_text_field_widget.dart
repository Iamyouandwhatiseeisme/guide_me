import 'package:flutter/widgets.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class CustomMapsTextField extends StatelessWidget {
  const CustomMapsTextField({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth - 32,
      height: 48,
      child: CustomTextFormField(
        textColor: Color(0xffF3F0E6),
        radiusSize: 16,
        color: Color(0xff292F32).withOpacity(0.75),
      ),
    );
  }
}
