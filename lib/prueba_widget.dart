import 'package:app_prueba/container_design.dart';
import 'package:flutter/material.dart';

class PruebaWidget extends StatefulWidget {
  const PruebaWidget({super.key});

  @override
  State<PruebaWidget> createState() => _PruebaWidgetState();
}

class _PruebaWidgetState extends State<PruebaWidget> {
  bool isEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            spacing: 10.0,
            children: [
              buttomEnable(),
              Expanded(
                child: SingleChildScrollView(
                  physics: isEnable ? const BouncingScrollPhysics() : NeverScrollableScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      spacing: 20,
                      children: [
                        Image.asset(
                          'assets/fondo.jpeg',
                          fit: BoxFit.fill,
                          width: 200,
                          height: 200,
                        ),
                        ContainerDesign(colors: [
                          Colors.yellow,
                          Colors.blue,
                          Colors.red,
                        ],),
                        ContainerDesign(colors: [
                          Colors.green,
                          Colors.white,
                          Colors.red,
                        ], isVertical: false,),
                        ContainerDesign(colors: [
                          Colors.blue,
                          Colors.white,
                          Colors.red,
                        ], isVertical: false,),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttomEnable() {
    return Container(
      decoration: BoxDecoration(
        color: isEnable ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(20.0),
      ),
      width: 200,
      height: 50,
      child: TextButton(
        child: const Text('Enable'),
        onPressed: () {
          setState(() {
            isEnable = !isEnable;
          });
        },
      ),
    );
  }
}