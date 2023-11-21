// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import '../../../widgets/presentation_layer_widgets.dart';

class AuthPageTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;

  const AuthPageTextField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
  }) : super(key: key);

  @override
  State<AuthPageTextField> createState() => _AuthPageTextFieldState();
}

class _AuthPageTextFieldState extends State<AuthPageTextField> {
  bool hideText = true;

  @override
  void dispose() {
    super.dispose();
  }

  void showPassword() {
    setState(() {
      hideText = !hideText;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.label == 'Password') {
      return passwordTextField();
    } else {
      return EmailTextField(controller: widget.controller, widget: widget);
    }
  }

  Widget passwordTextField() {
    return SizedBox(
      height: 48,
      width: 320,
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) =>
            value != null && value.length < 6 ? "Enter min 6 chatacters" : null,
        obscureText: hideText,
        onChanged: (text) {
          setState(() {});
        },
        keyboardType: TextInputType.visiblePassword,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: GestureDetector(
              onTap: () {
                showPassword();
              },
              child: Image.asset('assets/buttons/Eye.png')),
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
          focusedErrorBorder: OutlineInputBorder(
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
