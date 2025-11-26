import 'package:flutter/material.dart';

class PlaceAllCardPage extends StatefulWidget {
  const PlaceAllCardPage({super.key});

  @override
  State<PlaceAllCardPage> createState() => _PlaceAllCardPageState();
}

class _PlaceAllCardPageState extends State<PlaceAllCardPage> {
  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: mediaSize.width * 0.05,
            vertical: mediaSize.width * 0.05,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: mediaSize.width * 0.07,
                    ),
                  ),
                  SizedBox(width: mediaSize.width * 0.05,),
                  Text(
                    'All places',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: mediaSize.width * 0.05,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Wrap(
                children: [
                  Text('Hola...............'),
                  Text('Hola...............'),
                  Text('Hola..........'),
                  Text('Hola...............'),
                  Text('Hol.......'),
                  Text('Hola...............'),
                  Text('Hola...............'),
                  Text('Hola...............'),
                  Text('Hola...............'),
                  Text('Hola...............'),
                  Text('Hola...............'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}