import 'package:app_prueba/moduls/place/models/place_model.dart';
import 'package:app_prueba/moduls/place/pages/design_1_page.dart';
import 'package:app_prueba/moduls/place/widgets/card_float_detail_widget.dart';
import 'package:app_prueba/shared/widgets/fade_animated_widget.dart';
import 'package:flutter/material.dart';

class CardPlaceWidget extends StatefulWidget {
  PlaceModel placeModel;
  double width;
  double height;
  int indexElement;
  int delay;
  CardPlaceWidget({
    super.key,
    required this.placeModel,
    required this.width,
    required this.height,
    this.indexElement = 1,
    this.delay = 500
  });

  @override
  State<CardPlaceWidget> createState() => _CardPlaceWidgetState();
}

class _CardPlaceWidgetState extends State<CardPlaceWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // push
        // push and replace
        // // route name - Widget
        // pop
        Navigator.push(context, MaterialPageRoute(
          builder:(context) => Design1Page(placeModel: widget.placeModel,),
        ));
      },
      child: FadeAnimatedWidget(
        duration: const Duration(milliseconds: 500),
        delay: Duration(milliseconds: widget.indexElement * widget.delay),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: widget.width * 0.02, vertical: widget.width * 0.02),
          width: widget.width * 0.6,
          height: widget.width * 0.95,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3.0,
                spreadRadius: 2.0,
                offset: const Offset(0, 3)
              )
            ]
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Hero(
                  tag: 'ImagePlaceCard',
                  child: Image.network(
                    widget.placeModel.urlImg,
                    width: widget.width * 0.6,
                    height: widget.width * 0.95,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              CardFloatDetailWidget(
                widthWidgetParent: widget.width * 0.6,
                model: widget.placeModel,
                showPrice: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}