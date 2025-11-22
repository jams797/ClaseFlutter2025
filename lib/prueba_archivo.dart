import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class MyWidget2 extends StatefulWidget {
  const MyWidget2({super.key});

  @override
  State<MyWidget2> createState() => _MyWidget2State();
}

class _MyWidget2State extends State<MyWidget2> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}





ClasePrueba prueba = ClasePrueba(number2: 30, number1: 20);


class ClasePrueba {
  int number1;
  int number2;
  ClasePrueba({
    required this.number1,
    this.number2 = 0
  });
  // 
}


int nump = prueba.number1;
String stringp1 = 'sssss';
String stringp2 = 'Dato: ${prueba.number1 > 5 ? 'Hola' : 'Adios'}';