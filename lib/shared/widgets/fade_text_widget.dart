import 'package:flutter/material.dart';

class FadeTextWidget extends StatelessWidget {
  String text;
  double? fontSize;
  FadeTextWidget({super.key, required this.text, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect rect) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.black,
            Colors.black,
            Colors.transparent,
          ],
          stops: const <double>[0.0, 0.55, 1.0],
          tileMode: TileMode.mirror,
        ).createShader(rect);
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: fontSize,
        ),
      ),
    );
  }
}