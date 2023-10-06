import 'package:flutter/widgets.dart';

class OpenStatusLabelWidget extends StatelessWidget {
  const OpenStatusLabelWidget({
    super.key,
    required this.openStatus,
  });

  final String openStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0), child: Text(openStatus));
  }
}
