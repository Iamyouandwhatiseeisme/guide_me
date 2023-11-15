import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimationScaffold extends StatelessWidget {
  const LoadingAnimationScaffold({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: LoadingAnimationWidget.inkDrop(
            color: const Color(0xffC75E6B), size: 20),
      ),
    );
  }
}
