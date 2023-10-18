import 'package:flutter/material.dart';
import 'package:guide_me/business_layer/widgets/auth_page_text_field_widget.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required TextEditingController controller,
    required this.widget,
  }) : _controller = controller;

  final TextEditingController _controller;
  final MyTextField widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 320,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 16),
          label: Text(widget.label),
          hintStyle: TextStyle(
              fontFamily: 'Telegraf',
              fontWeight: FontWeight.w400,
              color: const Color(0xff292F32).withOpacity(0.75)),
          hintText: widget.hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(
                  width: 0.5, color: const Color(0xff292F32).withOpacity(0.5))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(
                  width: 0.5, color: const Color(0xff292F32).withOpacity(0.5))),
        ),
      ),
    );
  }
}
