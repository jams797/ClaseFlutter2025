import 'package:app_prueba/moduls/place/pages/design_1_page.dart';
import 'package:flutter/material.dart';

class PlaceListPage extends StatefulWidget {
  const PlaceListPage({super.key});

  @override
  State<PlaceListPage> createState() => _PlaceListPageState();
}

class _PlaceListPageState extends State<PlaceListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: GestureDetector(
            onTap: () {
              // push
              // push and replace
              // // route name - Widget
              // pop
              Navigator.push(context, MaterialPageRoute(builder:(context) => Design1Page(),));
            },
            child: Container(
              width: 200.0,
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}