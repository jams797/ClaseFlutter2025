import 'package:flutter/material.dart';

class ItemPageModel{
  String codePage;
  IconData iconData;
  IconData iconDataSelected;
  Widget page;

  ItemPageModel({
    required this.codePage,
    required this.iconData,
    required this.iconDataSelected,
    required this.page,
  });
}