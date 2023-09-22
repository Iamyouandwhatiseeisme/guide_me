// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final String label;
  final String hintText;

  const MyTextField({
    Key? key,
    required this.label,
    required this.hintText,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  final TextEditingController _controller = TextEditingController();

  bool hideText = true;

  @override
  void dispose() {
    _controller.dispose();
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
      return SizedBox(
        height: 48,
        width: 320,
        child: TextField(
          obscureText: hideText,
          onChanged: (text) {
            setState(() {});
          },
          keyboardType: TextInputType.visiblePassword,
          controller: _controller,
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
                    width: 0.5,
                    color: const Color(0xff292F32).withOpacity(0.5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                    width: 0.5,
                    color: const Color(0xff292F32).withOpacity(0.5))),
          ),
        ),
      );
    } else {
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
                    width: 0.5,
                    color: const Color(0xff292F32).withOpacity(0.5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(
                    width: 0.5,
                    color: const Color(0xff292F32).withOpacity(0.5))),
          ),
        ),
      );
    }
  }
}
