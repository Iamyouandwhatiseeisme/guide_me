import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guide_me/bloc/cubits.dart';
import 'package:guide_me/presentation/widgets/presentation_layer_widgets.dart';
import 'package:guide_me/presentation/pages/place_page/widgets/text_with_underline_grey_widget.dart';

class TextButton extends StatelessWidget {
  const TextButton({
    super.key,
    required this.onTap,
    required this.label,
  });
  final Function onTap;

  final String label;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WriteAReviewCubit, bool>(
      builder: (context, reviewed) {
        return GestureDetector(
          onTap: () {
            onTap();
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: TextWithUnderLine(
                color: const Color(0xff292F32).withOpacity(0.75),
                textToDisplay: label),
          ),
        );
      },
    );
  }
}
