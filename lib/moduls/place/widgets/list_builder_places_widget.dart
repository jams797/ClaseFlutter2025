import 'package:app_prueba/moduls/place/models/place_model.dart';
import 'package:app_prueba/moduls/place/models/place_page_controller.dart';
import 'package:app_prueba/moduls/place/widgets/card_place_widget.dart';
import 'package:app_prueba/shared/preferences/place_preferences.dart';
import 'package:flutter/material.dart';

class ListBuilderPlacesWidget extends StatefulWidget {
  bool? filterFavourite;
  ListBuilderPlacesWidget({super.key, this.filterFavourite});

  @override
  State<ListBuilderPlacesWidget> createState() => _ListBuilderPlacesWidgetState();
}

class _ListBuilderPlacesWidgetState extends State<ListBuilderPlacesWidget> {
  PlacePageController controller = PlacePageController();
  late PlacePreferences placePreferences;

  late List<PlaceModel> placeList = [];

  @override
  void initState() {
    placePreferences = PlacePreferences();
    initStateAsync();
    super.initState();
  }

  void initStateAsync() async {
    List<String> placesF = await placePreferences.getPlacesFavourite();
    placeList = controller.placeList.where((e) {
        if(widget.filterFavourite != null) {
            return placesF.contains(e.code);
        } else {
            return true;
        }
    }).toList();
    setState(() {
      
    });
  }
  
  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: (placeList.length + 1) ~/ 2,
      itemBuilder: (context, row) {
        int index = (2 * row);
        return Row(
          children: [
            Expanded(
              child: Center(
                child: CardPlaceWidget(
                  indexElement: index > 10 ? 1 : index,
                  delay: 150,
                  placeModel: placeList[index],
                  width: mediaSize.width * 0.65,
                  height: mediaSize.width * 0.95,
                ),
              ),
            ),
            Expanded(child: Center(
              child: ((index + 1) < placeList.length) ? CardPlaceWidget(
                indexElement: (index + 1) > 10 ? 1 : (index + 1),
                delay: 150,
                placeModel: placeList[index + 1],
                width: mediaSize.width * 0.65,
                height: mediaSize.width * 0.95,
              ) : Container(),
            ))
          ],
        );
      },
    );
  }
}