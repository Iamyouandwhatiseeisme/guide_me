import 'package:flutter/material.dart';

class PasswordTextFormFieldForChangePasswordPage extends StatefulWidget {
  const PasswordTextFormFieldForChangePasswordPage({
    Key? key,
    required this.controller,
    required this.label,
    required this.hideText,
    required this.updateUI,
    required this.showPassword,
    required this.setState,
  }) : super(key: key);
  final TextEditingController controller;
  final String label;
  final bool hideText;

  final Function updateUI;
  final Function showPassword;
  final StateSetter setState;

  @override
  State<PasswordTextFormFieldForChangePasswordPage> createState() =>
      _PasswordTextFormFieldForChangePasswordPageState();
}

class _PasswordTextFormFieldForChangePasswordPageState
    extends State<PasswordTextFormFieldForChangePasswordPage> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.hideText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (password) => password == null ? "incorrect password" : null,
      onChanged: (text) {
        widget.updateUI;
      },
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
            onTap: () {
              widget.showPassword();
              widget.setState(() {});
            },
            child: Image.asset('assets/buttons/Eye.png')),
        hintStyle: TextStyle(
            fontFamily: 'Telegraf',
            fontWeight: FontWeight.w400,
            color: const Color(0xff292F32).withOpacity(0.75)),
        hintText: widget.label,
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
    );
  }
}
