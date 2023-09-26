import 'package:flutter/widgets.dart';

class OpenHoursInfoWidget extends StatelessWidget {
  const OpenHoursInfoWidget({
    super.key,
    required this.openningHours,
  });

  final Map<String, String?> openningHours;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, top: 20),
      child: Builder(builder: (context) {
        if (openningHours['open_hour'] != null) {
          return Text(openningHours['open_hour']!.substring(0, 2) +
              ':' +
              openningHours['open_hour']!.substring(2, 4) +
              'AM -' +
              openningHours['close_hour']!.substring(0, 2) +
              ':' +
              openningHours['close_hour']!.substring(2, 4) +
              'PM');
        } else {
          return Text('No Information Available');
        }
      }),
    );
  }
}
