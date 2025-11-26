import 'package:app_prueba/moduls/home/models/item_page_model.dart';
import 'package:app_prueba/moduls/place/pages/place_list_page.dart';
import 'package:flutter/material.dart';

class HomePageController {

  String initMenu = 'home';

  List<ItemPageModel> menu = [
    ItemPageModel(
      codePage: 'home',
      iconData: Icons.house_outlined,
      iconDataSelected: Icons.house,
      page: PlaceListPage(),
    ),
    ItemPageModel(
      codePage: 'recent',
      iconData: Icons.timer_outlined,
      iconDataSelected: Icons.timer,
      page: Center(
        child: Text("Recientes"),
      ),
    ),
    ItemPageModel(
      codePage: 'favourite',
      iconData: Icons.ac_unit_outlined,
      iconDataSelected: Icons.ac_unit,
      page: Center(
        child: Text("Favoritos"),
      ),
    ),
    ItemPageModel(
      codePage: 'profile',
      iconData: Icons.person_outlined,
      iconDataSelected: Icons.person,
      page: Center(
        child: Text("Perfil"),
      ),
    ),
  ];
}