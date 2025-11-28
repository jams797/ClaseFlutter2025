import 'package:flutter/widgets.dart';

class FadeAnimatedWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final double beginOpacity;
  final Duration delay;
  final bool repeat;
  final bool reverse;
  final Curve curve;

  const FadeAnimatedWidget({super.key,
    required this.child,
    this.duration = const Duration(milliseconds: 500),
    this.beginOpacity = 0.0,
    required this.delay ,
    this.repeat = false,
    this.reverse = false,
    this.curve = Curves.linear,
  });

  @override
  State<FadeAnimatedWidget> createState() => _FadeAnimatedWidgetState();
}

class _FadeAnimatedWidgetState extends State<FadeAnimatedWidget> with SingleTickerProviderStateMixin{
  late final AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _opacity = Tween<double>(
      begin: widget.beginOpacity,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: widget.curve));;

    Future<void>.delayed(
      widget.delay,
      () {
        if(!mounted) return;
        if (widget.repeat) {
          _controller.repeat(reverse: widget.reverse);
        } else {
          _controller.forward();
        }
      }
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(opacity: _opacity, child: widget.child);
  }
}