import 'package:flutter/material.dart';

class RotateAnimatedWidget extends StatefulWidget {
  final Widget child;
  final double turns;
  final bool withFade;
  final double beginOpacity;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final bool repeat;
  final bool reverse;
  const RotateAnimatedWidget({super.key,
    required this.child,
    this.turns = .1,
    this.withFade = true,
    this.beginOpacity = 0.0,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    this.curve = Curves.easeOut,
    this.repeat = false,
    this.reverse = false
  });

  @override
  State<RotateAnimatedWidget> createState() => _RotateAnimatedWidgetState();
}

class _RotateAnimatedWidgetState extends State<RotateAnimatedWidget> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _turns;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    final curved = CurvedAnimation(parent: _controller, curve: widget.curve);
    _turns = Tween<double>(begin: - widget.turns, end: 0).animate(curved);
    _opacity = Tween<double>(
      begin: widget.beginOpacity,
      end: 1.0,
    ).animate(curved);
  }

  @override
  Widget build(BuildContext context) {
    Widget w = RotateAnimatedWidget(turns: _turns.value, child: widget.child);
    if(widget.withFade) {
      w = FadeTransition(opacity: _opacity, child: w);
    }
    return const Placeholder();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}