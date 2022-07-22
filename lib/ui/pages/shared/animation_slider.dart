import 'package:flutter/material.dart';

class AnimationSlider extends StatefulWidget {
  const AnimationSlider({super.key, required this.child});
  final Widget child;
  @override
  State<AnimationSlider> createState() => _AnimationSliderState();
}

class _AnimationSliderState extends State<AnimationSlider>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 700), vsync: this);

    animation =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0.0, 0.0))
            .animate(
      CurvedAnimation(parent: controller, curve: Curves.linear),
    );
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation, child: widget.child, //LogoWidget(),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
