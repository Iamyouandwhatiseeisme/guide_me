// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFormField extends StatelessWidget {
  final Color textColor;
  final double radiusSize;
  const CustomTextFormField({
    Key? key,
    required this.textColor,
    required this.radiusSize,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.start,
      decoration: InputDecoration(
          prefixIcon: Container(
              padding: const EdgeInsets.only(left: 24, right: 12),
              child: Icon(
                Icons.search_outlined,
                color: textColor,
              )),
          filled: true,
          fillColor: color,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radiusSize),
            borderSide: BorderSide.none,
          ),
          hintText: 'Search for activity, location etc.',
          hintStyle: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 16, color: textColor)),
    );
  }
}
