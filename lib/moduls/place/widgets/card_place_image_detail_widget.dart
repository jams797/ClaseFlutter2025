import 'package:app_prueba/moduls/place/models/place_model.dart';
import 'package:app_prueba/moduls/place/widgets/card_float_detail_widget.dart';
import 'package:flutter/material.dart';

class CardPlaceImageDetailWidget extends StatefulWidget {
  PlaceModel placeModel;
  CardPlaceImageDetailWidget({super.key, required this.placeModel});

  @override
  State<CardPlaceImageDetailWidget> createState() => _CardPlaceImageDetailWidgetState();
}

class _CardPlaceImageDetailWidgetState extends State<CardPlaceImageDetailWidget> {
  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      // width: mediaSize.height * 0.45,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                  spreadRadius: 3.0,
                  offset: const Offset(0, 10)
                )
              ]
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Hero(
                tag: 'ImagePlaceCard',
                child: Image.network(
                  widget.placeModel.urlImg,
                  height: mediaSize.height * 0.45,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          iconFloatImage(
            left: 30.0,
            iconData: Icons.arrow_back_ios,
            onPress: () => Navigator.pop(context),
          ),
          iconFloatImage(
            right: 30.0,
            iconData: Icons.bookmark_border_outlined,
            onPress: () { print('bookmark'); },
          ),
          CardFloatDetailWidget(
            widthWidgetParent: mediaSize.width * 0.8,
            model: widget.placeModel,
            showPrice: true,
          ),
        ],
      ),
    );
  }

  Widget iconFloatImage({
    double? left,
    double? right,
    required IconData iconData,
    Function()? onPress,
  }) {
    Size mediaSize = MediaQuery.of(context).size;
    return Positioned(
      top: 30.0,
      left: left,
      right: right,
      child: GestureDetector(
        onTap: onPress,
        child: Container(
          width: mediaSize.width * 0.08,
          height: mediaSize.width * 0.08,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: const Color.fromARGB(166, 0, 0, 0),
            borderRadius: BorderRadius.circular(100),
          ),
          child: Icon(
            iconData,
            color: Colors.white,
            size: mediaSize.width * 0.035,
          ),
        ),
      ),
    );
  }
}