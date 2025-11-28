import 'package:app_prueba/moduls/place/models/place_page_controller.dart';
import 'package:app_prueba/moduls/place/widgets/card_place_widget.dart';
import 'package:flutter/material.dart';

class PlaceAllCardPage extends StatefulWidget {
  const PlaceAllCardPage({super.key});

  @override
  State<PlaceAllCardPage> createState() => _PlaceAllCardPageState();
}

class _PlaceAllCardPageState extends State<PlaceAllCardPage> {
  PlacePageController controller = PlacePageController();

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
              Expanded(
                child: ListView.builder(
                  itemCount: (controller.placeList.length + 1) ~/ 2,
                  itemBuilder: (context, row) {
                    int index = (2 * row);
                    return Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: CardPlaceWidget(
                              indexElement: index > 10 ? 1 : index,
                              delay: 150,
                              placeModel: controller.placeList[index],
                              width: mediaSize.width * 0.65,
                              height: mediaSize.width * 0.95,
                            ),
                          ),
                        ),
                        Expanded(child: Center(
                          child: ((index + 1) < controller.placeList.length) ? CardPlaceWidget(
                            indexElement: (index + 1) > 10 ? 1 : (index + 1),
                            delay: 150,
                            placeModel: controller.placeList[index + 1],
                            width: mediaSize.width * 0.65,
                            height: mediaSize.width * 0.95,
                          ) : Container(),
                        ))
                      ],
                    );
                  },
                )
              ),
              // Expanded(
              //   child: SingleChildScrollView(
              //     child: Wrap(
              //       children:
              //       controller.placeList.asMap().entries.map((e) { 
              //         return CardPlaceWidget(
              //           indexElement: e.key,
              //           delay: 200,
              //           placeModel: e.value,
              //           width: mediaSize.width * 0.6,
              //           height: mediaSize.width * 0.95,
              //         );
              //       }).toList(),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}