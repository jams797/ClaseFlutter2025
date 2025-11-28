import 'package:flutter/material.dart';

enum SlideDirection {
  top,
  bottom,
  left,
  right
}

class SlideDirectionFadeAnimationWidget extends StatefulWidget {
  final Widget child;
  final SlideDirection direction;
  final double distance;
  final bool withFade;
  final double beginOpacity;
  final Duration duration;
  final Duration delay;
  final Curve curve;
  final bool repeat;
  final bool reverse;
  const SlideDirectionFadeAnimationWidget({super.key,
    required this.child,
    this.direction = SlideDirection.top,
    this.distance = 0.15,
    this.withFade = true,
    this.beginOpacity = 0.0,
    this.duration = const Duration(milliseconds: 500),
    this.delay = Duration.zero,
    this.curve = Curves.easeOut,
    this.repeat = false,
    this.reverse = false
  });

  @override
  State<SlideDirectionFadeAnimationWidget> createState() => _SlideDirectionFadeAnimationWidgetState();
}

class _SlideDirectionFadeAnimationWidgetState extends State<SlideDirectionFadeAnimationWidget> with SingleTickerProviderStateMixin{

  late final AnimationController _controller;
  late final Animation<double> _opacity;
  late final Animation<Offset> _position;

  Offset beginOffset() {
    switch(widget.direction) {
      case SlideDirection.top:
        return const Offset(0.0, 1.0);
      case SlideDirection.bottom:
        return const Offset(0.0, -1.0);
      case SlideDirection.left:
        return const Offset(1.0, 0.0);
      case SlideDirection.right:
        return const Offset(-1.0, 0.0);
    }
  }

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    final curved = CurvedAnimation(parent: _controller, curve: widget.curve);
    _position = Tween<Offset>(begin: beginOffset(), end: Offset.zero).animate(curved);
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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget wid = SlideTransition(position: _position, child: widget.child);
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