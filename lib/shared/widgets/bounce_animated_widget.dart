import 'package:flutter/material.dart';

class BounceAnimatedWidget extends StatefulWidget {
  final Widget child;
  final double beginScale;
  final double elasticity;
  final bool withFade;
  final double beginOpacity;
  final Duration duration;
  final Duration delay;
  final bool repeat;
  final bool reverse;
  const BounceAnimatedWidget({super.key,
    required this.child,
    this.beginScale = 0.75,
    this.elasticity = 0.9,
    this.withFade = true,
    this.beginOpacity = 0.0,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    this.repeat = false,
    this.reverse = false
  });

  @override
  State<BounceAnimatedWidget> createState() => _BounceAnimatedWidgetState();
}

class _BounceAnimatedWidgetState extends State<BounceAnimatedWidget> with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _scale;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _scale = Tween(begin: widget.beginScale, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: ElasticOutCurve(widget.elasticity))
    );
    _opacity = Tween<double>(
      begin: widget.beginOpacity,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    Future.delayed(widget.delay, () {
      if(!mounted) return;
      if(widget.repeat) {
        _controller.repeat(reverse: widget.reverse);
      } else {
        _controller.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget w = ScaleTransition(scale: _scale, child: widget.child);
    if(widget.withFade) {
      w = FadeTransition(opacity: _opacity, child: w);
    }
    return w;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}