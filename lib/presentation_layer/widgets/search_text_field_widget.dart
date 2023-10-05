// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/presentation_layer_widgets.dart';

class SearchTextFieldWIdget extends StatelessWidget {
  final Color color;
  const SearchTextFieldWIdget({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 36),
      child: CustomTextFormField(
        textColor: const Color(0xff292F32).withOpacity(0.75),
        color: color,
        radiusSize: 32,
      ),
    );
  }
}
