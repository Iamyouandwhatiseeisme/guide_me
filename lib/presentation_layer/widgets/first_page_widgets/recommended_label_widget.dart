import 'package:flutter/widgets.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: SizedBox(
        width: 230,
        height: 30,
        child: Row(
          children: [
            const Text(
              'Recommended',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              width: 8,
            ),
            Image.asset(
              'assets/images/logos/Information.png',
            )
          ],
        ),
      ),
    );
  }
}
