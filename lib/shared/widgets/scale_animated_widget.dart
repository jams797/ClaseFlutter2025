import 'package:flutter/material.dart';

class ScaleAnimatedWidget extends StatefulWidget {
  final Widget child;
  final double beginScale;
  final bool withFade;
  final double beginOpacity;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final bool repeat;
  final bool reverse;
  const ScaleAnimatedWidget({super.key,
    required this.child,
    this.beginScale = 0.0,
    this.withFade = false,
    this.beginOpacity = 0.0,
    this.duration = const Duration(milliseconds: 500),
    this.delay = const Duration(milliseconds: 0),
    this.curve = Curves.linear,
    this.repeat = false,
    this.reverse = false
  });

  @override
  State<ScaleAnimatedWidget> createState() => _ScaleAnimatedWidgetState();
}

class _ScaleAnimatedWidgetState extends State<ScaleAnimatedWidget> with SingleTickerProviderStateMixin{
  late final AnimationController _controller;
  late final Animation<double> _scale;
  late final Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    final curved = CurvedAnimation(parent: _controller, curve: widget.curve);
    _scale = Tween<double>(
      begin: widget.beginScale,
      end: 1.0,
    ).animate(curved);
    _opacity = Tween<double>(
      begin: widget.beginOpacity,
      end: 1.0,
    ).animate(curved);

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
    Widget wid = ScaleTransition(scale: _scale, child: widget.child);
    if(widget.withFade) {
      wid = FadeTransition(opacity: _opacity, child: wid);
    }
    return wid;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}