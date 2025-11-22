import 'package:flutter/material.dart';


class ContainerDesign extends StatelessWidget {
  List<Color> colors = [];
  bool isVertical;
  ContainerDesign({super.key, required this.colors, this.isVertical = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 200.0,
      child: Container(),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: Colors.black,
          width: 5.0
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(20, 20)
          )
        ],
        gradient: LinearGradient(
          begin: isVertical ? Alignment.topCenter : Alignment.centerLeft,
          end: isVertical ? Alignment.bottomCenter : Alignment.centerRight,
          colors: colors,
          stops: [0.3, 0.6, 0.9],
          // colors: [
          //   Colors.black,
          //   Colors.yellow,
          //   Colors.green
          // ]
        )
      ),
    );
  }
}