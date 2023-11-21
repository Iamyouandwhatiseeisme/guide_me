import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:guide_me/presentation_layer/widgets/authentification_page_widgets/auth_page_text_field_widget.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    super.key,
    required TextEditingController controller,
    required this.widget,
  }) : _controller = controller;

  final TextEditingController _controller;
  final AuthPageTextField widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      width: 320,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (email) => email != null && !EmailValidator.validate(email)
            ? "Enter a valid E-Mail"
            : null,
        controller: _controller,
        decoration: InputDecoration(
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(
                  width: 0.5, color: const Color(0xff292F32).withOpacity(0.5))),
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
          errorBorder: OutlineInputBorder(
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
