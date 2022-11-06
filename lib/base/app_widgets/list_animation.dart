import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class ListAnimation extends StatelessWidget {
  final int index;
  final Widget child;
  final bool isVertical;
  const ListAnimation({Key? key,this.isVertical = false,required this.index,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: index,
      child: SlideAnimation(
        duration: const Duration(milliseconds: 200),
        verticalOffset:  isVertical ? 100.0 : null,
        horizontalOffset: isVertical ? null : 100.0,
        child: FadeInAnimation(
          duration: const Duration(milliseconds: 200),
          child: child,
        ),
      ),
    );
  }
}
