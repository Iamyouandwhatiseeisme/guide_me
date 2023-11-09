import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  final Widget animatedWidget;
  const AnimationWidget({
    super.key,
    required this.animatedWidget,
  });

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animController;
  @override
  void initState() {
    super.initState();

    animController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    final curvedAnimation = CurvedAnimation(
        parent: animController,
        curve: Curves.bounceIn,
        reverseCurve: Curves.easeOutCirc);

    animation = Tween<double>(begin: 1, end: 2).animate(curvedAnimation)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          animController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          animController.forward();
        }
      });
    animController.forward();
  }

  @override
  void dispose() {
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: widget.animatedWidget,
    );
  }
}
