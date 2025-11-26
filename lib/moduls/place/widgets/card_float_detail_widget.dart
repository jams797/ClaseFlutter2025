import 'package:app_prueba/moduls/place/models/place_model.dart';
import 'package:flutter/material.dart';

class CardFloatDetailWidget extends StatefulWidget {
  double widthWidgetParent;
  PlaceModel model;
  bool showPrice;
  CardFloatDetailWidget({super.key, required this.widthWidgetParent, required this.model, required this.showPrice});

  @override
  State<CardFloatDetailWidget> createState() => _CardFloatDetailWidgetState();
}

class _CardFloatDetailWidgetState extends State<CardFloatDetailWidget> {
  @override
  Widget build(BuildContext context) {
    // Size mediaSize = MediaQuery.of(context).size;
    return Positioned(
      bottom: widget.widthWidgetParent * 0.02,
      left: 0,
      right: 0,
      child: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(widget.widthWidgetParent * 0.06),
        padding: EdgeInsets.all(widget.widthWidgetParent * 0.04),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color.fromARGB(255, 0, 24, 44),
              const Color.fromARGB(255, 0, 52, 94),
            ]
          )
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.model.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: widget.widthWidgetParent * 0.072,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_pin,
                        color: const Color.fromARGB(255, 153, 153, 153),
                      ),
                      Text(
                        widget.model.location,
                        style: TextStyle(
                          color: const Color.fromARGB(255, 153, 153, 153),
                          fontSize: widget.widthWidgetParent * 0.054,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            widget.showPrice ? dataWithPrice() : dataWithRanking(),
          ],
        ),
      ),
    );
  }

  Widget dataWithPrice() {
    return Column(
      children: [
        Text(
          'Price',
          style: TextStyle(
            color: Color.fromARGB(255, 153, 153, 153),
            fontSize: widget.widthWidgetParent * 0.046,
          ),
        ),
        RichText(
          text: TextSpan(
            text: '\$',
            style: TextStyle(
              color: Color.fromARGB(255, 100, 100, 100),
              fontSize: widget.widthWidgetParent * 0.046,
              fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: widget.model.price.toString(),
                style: TextStyle(
                  color: const Color.fromARGB(255, 209, 209, 209),
                  fontSize: widget.widthWidgetParent * 0.075,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget dataWithRanking() {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Colors.grey,
          size: widget.widthWidgetParent * 0.06,
        ),
        Text(
          widget.model.ranking.toString(),
          style: TextStyle(
            color: Colors.grey,
            fontSize: widget.widthWidgetParent * 0.06,
          ),
        )
      ],
    );
  }
}