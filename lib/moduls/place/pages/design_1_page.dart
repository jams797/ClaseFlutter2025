import 'package:app_prueba/moduls/place/widgets/card_place_image_detail_widget.dart';
import 'package:app_prueba/moduls/place/widgets/card_place_info_detail_widget.dart';
import 'package:flutter/material.dart';

class Design1Page extends StatefulWidget {
  const Design1Page({super.key});

  @override
  State<Design1Page> createState() => _Design1PageState();
}

class _Design1PageState extends State<Design1Page> {
  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              CardPlaceImageDetailWidget(),
              CardPlaceInfoDetailWidget(),
            ],
          ),
        ),
      ),
    );
  }
}