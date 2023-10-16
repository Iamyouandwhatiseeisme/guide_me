import 'package:flutter/material.dart';

class CollectionDialogUserInputReaderTextField extends StatelessWidget {
  const CollectionDialogUserInputReaderTextField({
    super.key,
    required TextEditingController textController,
  }) : _textController = textController;

  final TextEditingController _textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _textController,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.grey.withOpacity(0.8)),
          hintText: "Enter name of your collection",
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(22))),
    );
  }
}
