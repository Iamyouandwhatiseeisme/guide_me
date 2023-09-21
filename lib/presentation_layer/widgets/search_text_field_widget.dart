import 'package:flutter/material.dart';

class SearchTextFieldWIdget extends StatelessWidget {
  const SearchTextFieldWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 36),
      child: TextFormField(
        textAlign: TextAlign.start,
        decoration: InputDecoration(
            prefixIcon: Container(
                padding: const EdgeInsets.only(left: 24, right: 12),
                child: Image.asset('assets/images/logos/search.png')),
            filled: true,
            fillColor: const Color(0xffFFFFFF),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide.none,
            ),
            hintText: 'Search for activity, location etc.',
            hintStyle: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
      ),
    );
  }
}
