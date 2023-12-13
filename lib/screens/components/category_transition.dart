import 'package:flutter/material.dart';

class CategoryTransitionWidget extends StatefulWidget {
  final bool isHighlight;
  final Duration duration;
  const CategoryTransitionWidget({
    super.key,
    required this.isHighlight,
    required this.duration,
  });

  @override
  State<CategoryTransitionWidget> createState() =>
      _CategoryTransitionWidgetState();
}

class _CategoryTransitionWidgetState extends State<CategoryTransitionWidget>
    with TickerProviderStateMixin {
  late AnimationController _scaleAnimationController;
  late AnimationController _imageColorAnimationController;

  @override
  void initState() {
    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: widget.duration,
      lowerBound: 0.8,
      upperBound: 1,
    );

    _imageColorAnimationController = AnimationController(
      vsync: this,
      duration: widget.duration,
      lowerBound: 0,
      upperBound: 1,
    );

    if (widget.isHighlight) {
      _scaleAnimationController.repeat(
        reverse: true,
      );
      _imageColorAnimationController.repeat(
        reverse: true,
      );
    } else {
      _scaleAnimationController.animateTo(1);
      _imageColorAnimationController.animateTo(0);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  void dispose() {
    _scaleAnimationController.dispose();
    _imageColorAnimationController.dispose();
    super.dispose();
  }
}
