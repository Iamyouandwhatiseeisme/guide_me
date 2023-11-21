import 'package:flutter/widgets.dart';

class TypeLabelWidget extends StatelessWidget {
  const TypeLabelWidget({
    super.key,
    required this.typesInString,
  });

  final String typesInString;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Text(
        typesInString,
        style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: Color(0xff292F32)),
      ),
    );
  }
}
